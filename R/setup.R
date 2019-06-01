#' Setup
#' 
#' Setup your session, all subsequent calls will be done using the API key.
#'
#' @param key Your API key, freely available at \url{https://newsapi.org}.
#' 
#' @note You can specify \code{NEWSAPI_API_KEY} as environment variable, likely in your \code{.Renviron} file.
#' 
#' @examples
#' \dontrun{
#' newsapi_key("xXXxxXxXxXXx")  
#' }
#' 
#' @import purrr
#' @import httr
#' @import assertthat
#' 
#' @export
newsapi_key <- function(key){
  assert_that(!missing(key), msg = "Missing key")
  Sys.setenv(NEWSAPI_API_KEY = key)
}