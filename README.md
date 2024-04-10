# os-upgrade-r-user-library
A repository highlighting an approach on how to efficiently reinstall R User libraries following an OS upgrade

If customers are upgrading the OS on their Posit Workbench servers, there is an open question what to do with the R packages that users have installed into their user library (as set by `R_LIBS_USER` , typically `~/R/...`)

While there is some consensus that installing packages into a shared directory, especially then pointing to the "latest" CRAN repo is bad practice, those things still happen.

An impending OS upgrade will already interrupt users in some way (outage), but more productivity is lost by simply removing R packages installed in `R_LIBS_USER` and leave it as an exercise to the users to reinstall their R packages (cf. [Posit's recommendations](https://docs.posit.co/how-to-guides/upgrade-os-and-product/phase2-migrate/#remove-user-libraries)) 
