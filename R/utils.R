BASE_URL <- "https://newsapi.org"
VERSION <- "v2"

.get_key <- function() {
  key <- Sys.getenv("NEWSAPI_API_KEY")
  assert_that(!nchar(key) > 0, msg = "Missing key")
  return(key)
}