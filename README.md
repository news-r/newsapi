
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/news-r/newsapi.svg?branch=master)](https://travis-ci.org/news-r/newsapi)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/news-r/newsapi?branch=master&svg=true)](https://ci.appveyor.com/project/news-r/newsapi)
<!-- badges: end -->

# newsapi

> Get breaking news headlines, and search for articles from over 30,000
> news sources and blogs with our news API.

[News API](https://newsapi.org) integration with R.

## Installation

``` r
# install.packages("remotes")
remotes::install_github("news-r/newsapi")
```

## Setup

Create a free account at [newsapi.org](https://newsapi.org/) to create
an API key.

``` r
newsapi_key("xxXXxxXx")
```

Note that you can specify the key as environment variable
(`NEWSAPI_API_KEY`), likely in your `.Renviron` for convenience.

## Example

``` r
library(newsapi)
#> API key loaded!

news_sources()
#> # A tibble: 129 x 7
#>    id                name              description                                                                                            url              category  language country
#>    <chr>             <chr>             <chr>                                                                                                  <chr>            <chr>     <chr>    <chr>  
#>  1 abc-news          ABC News          "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCN… https://abcnews… general   en       us     
#>  2 abc-news-au       ABC News (AU)     "Australia's most trusted source of local, national and world news. Comprehensive, independent, in-de… http://www.abc.… general   en       au     
#>  3 aftenposten       Aftenposten       "Norges ledende nettavis med alltid oppdaterte nyheter innenfor innenriks, utenriks, sport og kultur." https://www.aft… general   no       no     
#>  4 al-jazeera-engli… Al Jazeera Engli… "News, analysis from the Middle East and worldwide, multimedia and interactives, opinions, documentar… http://www.alja… general   en       us     
#>  5 ansa              ANSA.it           "Agenzia ANSA: ultime notizie, foto, video e approfondimenti su: cronaca, politica, economia, regioni… http://www.ansa… general   it       it     
#>  6 argaam            Argaam            "ارقام موقع متخصص في متابعة سوق الأسهم السعودي تداول - تاسي - مع تغطيه معمقة لشركات واسعار ومنتجات ال… http://www.arga… business  ar       sa     
#>  7 ars-technica      Ars Technica      "The PC enthusiast's resource. Power users and the tools they love, without computing religion."       http://arstechn… technolo… en       us     
#>  8 ary-news          Ary News          "ARY News is a Pakistani news channel committed to bring you up-to-the minute Pakistan news and featu… https://arynews… general   ud       pk     
#>  9 associated-press  Associated Press  "The AP delivers in-depth coverage on the international, politics, lifestyle, business, and entertain… https://apnews.… general   en       us     
#> 10 australian-finan… Australian Finan… "The Australian Financial Review reports the latest news from business, finance, investment and polit… http://www.afr.… business  en       au     
#> # … with 119 more rows
top_headlines("China")
#> # A tibble: 46 x 8
#>    source   author   title             description                            url                         urlToImage                     publishedAt   content                           
#>    <chr>    <chr>    <chr>             <chr>                                  <chr>                       <chr>                          <chr>         <chr>                             
#>  1 reuters  Yilei S… New coronavirus … China reported a sharp fall in new de… http://feeds.reuters.com/~… https://s2.reutersmedia.net/r… 2020-02-22T1… "BEIJING (Reuters) - China report…
#>  2 Reuters  Yilei S… New coronavirus … China reported a sharp fall in new de… http://feeds.reuters.com/~… https://s2.reutersmedia.net/r… 2020-02-22T1… "BEIJING (Reuters) - China report…
#>  3 reuters  Reuters… Factbox: Latest … China reported a sharp decrease in ne… http://feeds.reuters.com/~… https://s4.reutersmedia.net/r… 2020-02-22T1… "(Reuters) - China reported a sha…
#>  4 Reuters  Reuters… Factbox: Latest … China reported a sharp decrease in ne… http://feeds.reuters.com/~… https://s4.reutersmedia.net/r… 2020-02-22T1… "(Reuters) - China reported a sha…
#>  5 rtl-nie… RTL Nie… Nederlands bedri… Twee ondernemers hebben aangifte geda… https://www.rtlnieuws.nl/n… https://www.rtlnieuws.nl/site… 2020-02-22T1… "De ondernemers deden een aanbeta…
#>  6 RTL Nie… RTL Nie… Nederlands bedri… Twee ondernemers hebben aangifte geda… https://www.rtlnieuws.nl/n… https://www.rtlnieuws.nl/site… 2020-02-22T1… "De ondernemers deden een aanbeta…
#>  7 wirtsch… Wirtsch… Wegen Coronaviru… Der Internationale Währungsfonds senk… https://www.wiwo.de/politi… https://www.wiwo.de/images/ak… 2020-02-22T1… "Der Internationale Währungsfonds…
#>  8 Wirtsch… Wirtsch… Wegen Coronaviru… Der Internationale Währungsfonds senk… https://www.wiwo.de/politi… https://www.wiwo.de/images/ak… 2020-02-22T1… "Der Internationale Währungsfonds…
#>  9 handels… Mathias… Warum Trump die … Der US-Präsident reist nach Indien. D… https://www.handelsblatt.c… https://www.handelsblatt.com/… 2020-02-22T1… "Bangkok Den Anblick von extremer…
#> 10 Handels… Mathias… Warum Trump die … Der US-Präsident reist nach Indien. D… https://www.handelsblatt.c… https://www.handelsblatt.com/… 2020-02-22T1… "Bangkok Den Anblick von extremer…
#> # … with 36 more rows
every_news("Trump")
#> # A tibble: 193 x 8
#>    source   author   title             description                               url                   urlToImage                      publishedAt  content                              
#>    <chr>    <chr>    <chr>             <chr>                                     <chr>                 <chr>                           <chr>        <chr>                                
#>  1 wired    Garrett… How Trump Hollow… Acting director of national intelligence… https://www.wired.co… https://media.wired.com/photos… 2020-02-21T… "The State Department, which has slo…
#>  2 Wired    Garrett… How Trump Hollow… Acting director of national intelligence… https://www.wired.co… https://media.wired.com/photos… 2020-02-21T… "The State Department, which has slo…
#>  3 Lifehac… Emily P… How to Stream th… President Trump is set to deliver the St… https://lifehacker.c… https://i.kinja-img.com/gawker… 2020-02-04T… "President Trump is set to deliver t…
#>  4 wired    Caitlin… How to Watch the… President Trump will deliver his third a… https://www.wired.co… https://media.wired.com/photos… 2020-02-04T… "President Donald Trump is set to de…
#>  5 Wired    Caitlin… How to Watch the… President Trump will deliver his third a… https://www.wired.co… https://media.wired.com/photos… 2020-02-04T… "President Donald Trump is set to de…
#>  6 Lifehac… Josh Oc… What You Need to… This week in politics, the Iowa caucuses… https://lifehacker.c… https://i.kinja-img.com/gawker… 2020-02-05T… "This week in politics, the Iowa cau…
#>  7 wired    Garrett… Donald Trump Now… After making it through a criminal inves… https://www.wired.co… https://media.wired.com/photos… 2020-02-06T… "Welcome to a dark day in Americas m…
#>  8 Wired    Garrett… Donald Trump Now… After making it through a criminal inves… https://www.wired.co… https://media.wired.com/photos… 2020-02-06T… "Welcome to a dark day in Americas m…
#>  9 cnn      <NA>     Giuliani's role:… CNN political analyst Gloria Borger brea… https://www.cnn.com/… https://cdn.cnn.com/cnnnext/da… 2020-01-28T… "Chat with us in Facebook Messenger.…
#> 10 CNN      <NA>     Giuliani's role:… CNN political analyst Gloria Borger brea… https://www.cnn.com/… https://cdn.cnn.com/cnnnext/da… 2020-01-28T… "Chat with us in Facebook Messenger.…
#> # … with 183 more rows
```
