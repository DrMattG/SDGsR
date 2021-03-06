% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SDGs_colours.R
\name{SDGs_cols}
\alias{SDGs_cols}
\title{SDGS colour pallette}
\usage{
SDGs_cols(...)
}
\value{
hex colour for each Goal
}
\description{
get the SDGS colour for each Goal
}
\examples{
library(SDGsR)
library(tidyverse)
Norway<-get_indicator(Country = "578", indicator = "15.4.1")
Norway \%>\%
select(timePeriodStart,value,seriesDescription) \%>\%
ggplot(aes(timePeriodStart, value))+
geom_point(colour=SDGs_cols("Goal15"))+
ggtitle(label=paste0(Norway$seriesDescription[1]))
}
