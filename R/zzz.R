.onAttach <- function(libname = find.package("newsapi"), pkgname = "newsapi") {

  key <- Sys.getenv("NEWSAPI_API_KEY")

  msg <- "No API key found, see `newsapi_key`"
  if(nchar(key) > 1) msg <- "API key loaded!"

  packageStartupMessage(msg)

}
