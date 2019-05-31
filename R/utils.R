BASE_URL <- "https://newsapi.org"
VERSION <- "v2"
SRCS <- c(
  "business",
  "entertainment",
  "general",
  "health",
  "science",
  "sports",
  "technology"
)

.get_key <- function() {
  key <- Sys.getenv("NEWSAPI_API_KEY")
  assert_that(nchar(key) > 0, msg = "Missing key")
  return(key)
}

.key_header <- function(){
  httr::add_headers(`X-Api-Key` = .get_key())
}

.build_endpoint <- function(endpoint){
  c(VERSION, endpoint)
}
