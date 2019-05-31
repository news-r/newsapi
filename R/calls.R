#' Top Headlines
#' 
#' @export
top_headlines <- function(q = NULL, country = NULL, category = NULL, sources = NULL, pages = Inf) {
  
  url <- parse_url(BASE_URL)
  url$path <- .build_endpoint("top-headlines")
  url$query <- list(
    q = q,
    pageSize = 100,
    sources = sources,
    category = category,
    country = country
  )
  url <- build_url(url)
  response <- httr::GET(url, .key_header())
  content <- content(response)
  stop_for_status(response, task = content$message)
  
}