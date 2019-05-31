#' Top Headlines
#' 
#' Returns top headlines.
#' 
#' @param q Keywords or a phrase to search for.
#' @param country The 2-letter ISO 3166-1 code of the country you want to get headlines for.
#' @param category The category you want to get headlines for. 
#'  Possible options: \code{business}, \code{entertainment}, \code{general}, \code{health}, \code{science}, \code{sports}, \code{technology}. 
#'  Note: you can't mix this argument with the \code{sources} argument.
#' @param sources A \code{vector} of identifiers for the news sources or blogs you want headlines from. 
#'  Use \code{\link{news_sources}} to locate these. 
#'  Note: you can't mix this argument with the \code{country} or \code{category} argument.
#' @param results Number of results to return, on free plan this is often \code{100}. Set to \code{Inf} to return everything.
#' 
#' @examples
#' \dontrun{
#' top_headlines("Trump")
#' }
#' 
#' @export
top_headlines <- function(q = NULL, results = 100, country = NULL, category = NULL, sources = NULL) {

  opts <- list(
    q = q,
    pageSize = 100,
    sources = .parse_sources(sources),
    category = category,
    country = country
  )

  content <- .call_api(1, "top-headlines", opts)
  content <- .paginate(content, "top-headlines", opts, results)

  content %>% 
    map("articles") %>% 
    flatten() %>% 
    .parse()
}

#' Everything
#' 
#' Search through all articles.
#' 
#' @inheritParams top_headlines
#' @inheritParams news_sources
#' @param domains,exclude_domains A \code{vector} of domains to restrict the search to, or exclude, i.e.: \code{bbc.co.uk}.
#' @param since,until \code{Date} or \code{POSIX} indicating oldest and newest article allowed.
#' @param sort The order to sort the articles in. Possible options: \code{relevancy}, \code{popularity}, \code{publishedAt}.
#' 
#' @examples
#' \dontrun{
#'  every_news("Trump")
#' }
#' 
#' @export
every_news <- function(q = NULL, results = 100, sources = NULL, domains = NULL, exclude_domains = NULL, since = NULL, until = NULL, language = NULL, sort = NULL) {

  opts <- list(
    q = q,
    pageSize = 100,
    sources = .parse_sources(sources),
    domains = domains,
    excludeDomains = exclude_domains,
    since = since,
    until = until,
    language = language,
    sortBy = sort
  )

  content <- .call_api(1, "everything", opts)
  content <- .paginate(content, "everything", opts, results)

  content %>% 
    map("articles") %>% 
    flatten() %>% 
    .parse()
}


#' News Sources
#' 
#' Get the list of available sources.
#' 
#' @inheritParams top_headlines
#' @param language Find sources that display news in a specific language. 
#'  Possible options: \code{ar}, \code{de}, \code{en}, \code{es}, \code{fr}, \code{he}, 
#'  \code{it}, \code{nl}, \code{no}, \code{pt}, \code{ru}, \code{se}, \code{ud}, \code{zh}. Default: all languages.
#' 
#' @examples
#' \dontrun{
#'  news_sources()
#' }
#' 
#' @export
news_sources <- function(country = NULL, category = NULL, language = NULL){

  opts <- list(
    language = language,
    category = category,
    country = country
  )

  content <- .call_api(NULL, "sources", opts)

  content$sources %>% 
    map_dfr(tibble::as_tibble)
}
