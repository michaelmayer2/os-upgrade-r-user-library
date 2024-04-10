source("/home/posit0001/upgrade/package.R")

pkgtempdir<-"/tmp/util"

if(!dir.exists(pkgtempdir)) {
  dir.create(pkgtempdir,recursive=TRUE)
  install.packages(c("rjson","RCurl"),pkgtempdir)
}
.libPaths(pkgtempdir)
library(RCurl)
library(rjson)

data=fromJSON(getURL("https://packagemanager.posit.co/__api__/metrics/packages?_sort=count&_order=desc&_days=365&_sourceType=r&_limit=3000&_page=1"))

packages_av<-as.data.frame(available.packages())[c("Package","Version")]
packages_df<-packages_av[packages_av$Package %in% unlist(data)[c(seq(1,2*length(data),2))],]

selected_pkg_idx<-sample(dim(packages_df)[1],sample(20,1))
packages_selected<-packages_df[selected_pkg_idx,]

write_pkg_inventory(packages_selected)

