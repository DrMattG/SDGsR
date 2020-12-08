#' get_indicator_example_data
#' @description get the example data for the indicator example shiny
#' @return tibble of indicator data
#' @examples
#' \dontrun{
#' get_indicator_example_data()
#' }
#' @export

get_indicator_example_data<-function(){
library(SDGsR)
library(tidyverse)

Ind_15.6.1<-get_indicator_data(indicator = '15.6.1')
Ind_15.9.1<-get_indicator_data(indicator = '15.9.1')
Ind_15.a.1<-get_indicator_data(indicator = '15.a.1')
Ind_15.6.1<-Ind_15.6.1 %>%
  group_by(seriesDescription, geoAreaName) %>%
  select(geoAreaName, timePeriodStart,value, seriesDescription, geoAreaCode)
Ind_15.9.1<-Ind_15.9.1 %>%
  group_by(seriesDescription, geoAreaName) %>%
  select(geoAreaName, timePeriodStart,value, seriesDescription, geoAreaCode)
Ind_15.a.1<-Ind_15.a.1 %>%
  group_by(seriesDescription, geoAreaName) %>%
  select(geoAreaName, timePeriodStart,value, seriesDescription, geoAreaCode)
Ind_15_data=rbind(Ind_15.6.1,Ind_15.9.1, Ind_15.a.1)
Ind_15_data$Indicator=c(rep("Ind_15.6.1", dim(Ind_15.6.1)[1]), rep("Ind_15.9.1", dim(Ind_15.9.1)[1]), rep("Ind_15.a.1", dim(Ind_15.a.1)[1]))

data("lookup_country_codes")

Ind_15_data %>%
  mutate(region=tolower(geoAreaName)) %>%
  mutate(value=as.numeric(value))->mapp_data

mapp_data=mapp_data %>%
  full_join(lookup_country_codes, copy=FALSE,by=c("geoAreaName"="country_or_area")) %>%
  select(iso_alpha3_code, geoAreaName, value, seriesDescription, Indicator, timePeriodStart) %>%
  drop_na(iso_alpha3_code) %>%
  drop_na(Indicator)
return(mapp_data)
}
