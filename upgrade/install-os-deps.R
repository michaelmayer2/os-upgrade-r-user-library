source("/home/posit0001/upgrade/package.R")

load_pak()

deps<-get_os_deps(prefix="pkgs-selected-combined")

system(deps$pre_install)
system(deps$install_scripts)
system(deps$post_install)

