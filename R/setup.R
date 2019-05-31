#' Setup
#' 
#' Setup your session, all subsequent calls will be done using the API key.
#'
#' @param key Your API key, freely available at \url{https://newsapi.org}.
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