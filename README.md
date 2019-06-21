<!-- README.md is generated from README.Rmd. Please edit that file -->



<!-- badges: start -->
[![Travis build status](https://travis-ci.org/news-r/newsapi.svg?branch=master)](https://travis-ci.org/news-r/newsapi)
<!-- badges: end -->

# newsapi

> Get breaking news headlines, and search for articles from over 30,000 news sources and blogs with our news API.

[News API](https://newsapi.org) integration with R.

## Installation

``` r
# install.packages("remotes")
remotes::install_github("news-r/newsapi")
```

## Setup

Get a free key from the [newsapi.org](https://newsapi.org/) website.

```r
newsapi_key("xxXXxxXx")
```

Note that you can specify the `NEWSAPI_API_KEY` key as an environment variable in your `.Renviron` for convenience.

## Example


```r
library(newsapi)

news_sources()
#> # A tibble: 135 x 7
#>    id       name     description          url     category language country
#>    <chr>    <chr>    <chr>                <chr>   <chr>    <chr>    <chr>  
#>  1 abc-news ABC News Your trusted source… https:… general  en       us     
#>  2 abc-new… ABC New… Australia's most tr… http:/… general  en       au     
#>  3 aftenpo… Aftenpo… Norges ledende nett… https:… general  no       no     
#>  4 al-jaze… Al Jaze… News, analysis from… http:/… general  en       us     
#>  5 ansa     ANSA.it  Agenzia ANSA: ultim… http:/… general  it       it     
#>  6 argaam   Argaam   "ارقام موقع متخصص ف… http:/… business ar       sa     
#>  7 ars-tec… Ars Tec… The PC enthusiast's… http:/… technol… en       us     
#>  8 ary-news Ary News ARY News is a Pakis… https:… general  ud       pk     
#>  9 associa… Associa… The AP delivers in-… https:… general  en       us     
#> 10 austral… Austral… The Australian Fina… http:/… business en       au     
#> # … with 125 more rows
top_headlines("China")
#> # A tibble: 52 x 8
#>    source  author  title  description  url   urlToImage publishedAt content
#>    <chr>   <chr>   <chr>  <chr>        <chr> <chr>      <chr>       <chr>  
#>  1 focus   Von Au… Hande… Nachdem vie… http… https://p… 2019-05-31… Nachde…
#>  2 Focus   Von Au… Hande… Nachdem vie… http… https://p… 2019-05-31… Nachde…
#>  3 spiege… Spiege… Expor… Die Führung… http… https://c… 2019-05-31… "Freit…
#>  4 Spiege… Spiege… Expor… Die Führung… http… https://c… 2019-05-31… "Freit…
#>  5 cnn     Matt E… China… The United … http… https://c… 2019-05-31… <NA>   
#>  6 CNN     Matt E… China… The United … http… https://c… 2019-05-31… <NA>   
#>  7 cbc-ne… CBC Ne… Canad… While Canad… http… https://i… 2019-05-31… "Plant…
#>  8 CBC Ne… CBC Ne… Canad… While Canad… http… https://i… 2019-05-31… "Plant…
#>  9 cnn-es  CNN     Trump… Los mercado… http… https://c… 2019-05-31… <NA>   
#> 10 CNN Sp… CNN     Trump… Los mercado… http… https://c… 2019-05-31… <NA>   
#> # … with 42 more rows
every_news("Trump")
#> # A tibble: 193 x 8
#>    source  author  title  description  url   urlToImage publishedAt content
#>    <chr>   <chr>   <chr>  <chr>        <chr> <chr>      <chr>       <chr>  
#>  1 Lifeha… Josh O… Which… This June, … http… https://i… 2019-05-24… "This …
#>  2 Lifeha… Josh O… Why Y… Since takin… http… https://i… 2019-05-06… "Since…
#>  3 Lifeha… Nicole… How I… As you migh… http… https://i… 2019-05-10… "As yo…
#>  4 the-ve… Makena… The t… President T… http… https://c… 2019-05-31… Over t…
#>  5 The Ve… Makena… The t… President T… http… https://c… 2019-05-31… Over t…
#>  6 wired   Alexan… Trump… The Trump a… http… https://m… 2019-05-31… "This …
#>  7 Wired   Alexan… Trump… The Trump a… http… https://m… 2019-05-31… "This …
#>  8 the-ne… KATIE … Your … Donald Trum… http… https://s… 2019-05-08… "By mo…
#>  9 The Ne… KATIE … Your … Donald Trum… http… https://s… 2019-05-08… "By mo…
#> 10 techcr… Brian … The W… It’s no sec… http… https://t… 2019-05-15… "Its n…
#> # … with 183 more rows
```
