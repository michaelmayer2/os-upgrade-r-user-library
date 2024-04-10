source("/home/posit0001/upgrade/package.R")

load_pak()

system(paste("rm -rf",Sys.getenv("R_LIBS_USER")))

restore_pkg_inventory(prefix="pkgs")

system("rm -rf .cache/R/pkgcache")
