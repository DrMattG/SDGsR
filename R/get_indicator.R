#' Get SDGS indicators and values for a specific country
#' @description get indicators for a specific country and indicator
#' @param Country the M49 code for the country you are interested in
#' @param indicator the code for the indicator you are interested in
#' @return dataframe of indicator and values
#' @examples require(SDGsR)
#' get_indicator(Country="12", indicator="15.6.1")
#' @export

get_indicator<-function(Country, indicator){
  url<-paste0("https://unstats.un.org/sdgs/UNSDGAPIV5/v1/sdg/Indicator/Data?indicator=",
              indicator,"&areaCode=", Country)
  datcall <- jsonlite::fromJSON(url)
  page<-as.data.frame(datcall$data)
  return(page)
}

#' Get data for a specific indicator
#' @description get indicator data for a specific indicator
#' @param indicator the code for the indicator you are interested in
#' @return dataframe of indicator and values
#' @examples get_indicator_data (indicator="15.6.1")
#' @export

get_indicator_data<-function(indicator){
  url<-paste0("https://unstats.un.org/sdgs/UNSDGAPIV5/v1/sdg/Indicator/Data?indicator=",
              indicator,"&pageSize=10000")
  datcall <- jsonlite::fromJSON(url)

  indicator<-as.data.frame(datcall$data)

  return(indicator)
}

#Need to check the page number never exceeds 10000
