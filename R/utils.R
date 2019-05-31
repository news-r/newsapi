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

.parse_sources <- function(sources){
  if(!is.null(sources))
    sources <- paste0(sources, collapse = ",")
  return(sources)
}

.call_api <- function(page = NULL, endpoint, opts){
  if(!is.null(page)) opts$page <- page
  url <- parse_url(BASE_URL)
  url$path <- .build_endpoint(endpoint)
  url$query <- opts
  url <- build_url(url)
  response <- httr::GET(url, .key_header())
  content <- content(response)
  stop_for_status(response, task = content$message)
  return(content)
}

.paginate <- function(content, endpoint, opts, results = Inf){

  .safe_call <- purrr::safely(.call_api)

  if(is.infinite(results)) 
    results <- content$totalResults 
  
  pages <- (results - 100) %/% 100
  
  additional_content <- list() # initialise
  if(pages > 0){
    additional_content <- purrr::map(2:pages, .safe_call, "top-headlines", opts) %>% 
      transpose()
    content <- append(list(content), additional_content$result)
  } else {
     content <- list(content)
  }
  return(content)
}

.process_posix <- function(x = NULL){
  if(!is.null(x))
    x <- format(x, "%Y-%m-%dT%H:%M:%S")
  return(x)
}

.parse <- function(content){
  map_dfr(
    content,
    function(row){
      row <- map(row, function(cell){
        if(length(cell) > 1) cell <- unlist(cell)
        if(is.null(cell)) cell <- NA
        return(cell)
      })
      dplyr::as_tibble(row)
    }
  )
}