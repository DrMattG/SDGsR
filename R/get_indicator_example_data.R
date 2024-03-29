#' Get and example of indicator data for 15.6.1, 15.9.1 and 15.a.1
#' @description get the example data for the indicator example shiny
#' @return tibble of indicator data
#' @import dplyr
#' @examples
#' \dontrun{
#' require(SDGsR)
#' get_indicator_example_data()
#' }
#' @keywords Internal
#' @export

get_indicator_example_data<-function(){

Ind_15.6.1<-get_indicator_data(indicator = '15.6.1')
Ind_15.9.1<-get_indicator_data(indicator = '15.9.1')
Ind_15.a.1<-get_indicator_data(indicator = '15.a.1')
Ind_15.6.1<-Ind_15.6.1 %>%
  dplyr::group_by(seriesDescription, geoAreaName) %>%
  dplyr::select(geoAreaName, timePeriodStart,value, seriesDescription, geoAreaCode)
Ind_15.9.1<-Ind_15.9.1 %>%
  dplyr::group_by(seriesDescription, geoAreaName) %>%
  dplyr::select(geoAreaName, timePeriodStart,value, seriesDescription, geoAreaCode)
Ind_15.a.1<-Ind_15.a.1 %>%
  dplyr::group_by(seriesDescription, geoAreaName) %>%
  dplyr::select(geoAreaName, timePeriodStart,value, seriesDescription, geoAreaCode)
Ind_15_data<-rbind(Ind_15.6.1,Ind_15.9.1, Ind_15.a.1)
Ind_15_data$Indicator<-c(rep("Ind_15.6.1",
                             dim(Ind_15.6.1)[1]),
                         rep("Ind_15.9.1",
                             dim(Ind_15.9.1)[1]),
                         rep("Ind_15.a.1",
                             dim(Ind_15.a.1)[1]))

data("lookup_country_codes")

Ind_15_data %>%
  dplyr::mutate(region=tolower(geoAreaName)) %>%
  dplyr::mutate(value=as.numeric(value))->mapp_data

mapp_data<-mapp_data %>%
  dplyr::full_join(lookup_country_codes,
            copy=FALSE,
            by=c("geoAreaName"="country_or_area")) %>%
  dplyr::select(iso_alpha3_code,
         geoAreaName, value,
         seriesDescription,
         Indicator,
         timePeriodStart) %>%
  tidyr::drop_na(iso_alpha3_code) %>%
  tidyr::drop_na(Indicator)
return(mapp_data)
}
