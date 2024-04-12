source("/home/posit0001/upgrade/package.R")

load_pak()

deps<-get_os_deps(prefix="pkgs-selected-combined")

if (length(deps$pre_install)>0) system(deps$pre_install)
if (length(deps$install_scripts)>0) system(deps$install_scripts)
if (length(deps$post_install)>0) system(deps$post_install)

