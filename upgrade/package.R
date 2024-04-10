load_pak <- function() {
  options(pak.no_extra_messages = TRUE)
  #Sys.setenv(R_PKG_CACHE_DIR="/home/pak")
  tmp_dir<-"/tmp/pak"
  if (!dir.exists(tmp_dir)) {
	  dir.create(tmp_dir,recursive=TRUE)
  
  install.packages("pak", tmp_dir , repos = sprintf(
    "https://r-lib.github.io/p/pak/stable/%s/%s/%s",
    .Platform$pkgType,
    R.Version()$os,
    R.Version()$arch
  ))
  }
  .libPaths(tmp_dir)
  library(pak)
}

save_pkg_inventory <- function() {
  pkg_library<-Sys.getenv("R_LIBS_USER")
  
  packages_df<-as.data.frame(installed.packages(lib.loc=pkg_library))[c("Package","Version")]
  packages=paste0(packages_df$Package,"@",packages_df$Version)
  
  rver<-paste0(R.Version()$major,'.',strsplit(R.Version()$minor,'[.]')[[1]][1])
  
  write(packages,file=paste0("pkgs-",rver,".txt"))
}

restore_pkg_inventory <- function(prefix="pkgs") {
  rver<-paste0(R.Version()$major,'.',strsplit(R.Version()$minor,'[.]')[[1]][1])
  
  con=file(paste0(prefix,"-",rver,".txt"),"r")
  packages<-readLines(con)
  close(con)
  install_dir=Sys.getenv("R_LIBS_USER")
  if (!dir.exists(install_dir)) { dir.create(install_dir,recursive=TRUE) }
  pak::pkg_install(packages,install_dir)
}

get_os_deps <- function(prefix="pkgs") {
  
  con=file(paste0(prefix,".txt"),"r")
  packages<-readLines(con)
  close(con)
  
  pak::pkg_sysreqs(packages)
  # deps$pre_install
  # deps$install_scripts
  # deps$post_install
}

write_pkg_inventory <- function(packages_df) {
  
  packages=paste0(packages_df$Package,"@",packages_df$Version)
  
  rver<-paste0(R.Version()$major,'.',strsplit(R.Version()$minor,'[.]')[[1]][1])
  
  write(packages,file=paste0("pkgs-selected-",rver,".txt"))
}
