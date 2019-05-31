.onAttach <- function(libname = find.package("oRion"), pkgname = "oRion") {

  key <- Sys.getenv("NEWSAPI_API_KEY")

  msg <- "No API key found, see `newsapi_key`"
  if(nchar(key) > 1) msg <- "API key found!"

  packageStartupMessage(msg)

}