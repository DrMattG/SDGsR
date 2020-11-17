#' get_indicator
#' @description get indicators for a specific country and indicator
#' @param Country the M49 code for the country you are interested in
#' @param indicator the code for the indicator you are interested in
#' @return dataframe of indicator and values
#' @examples get_indicator(Country="12", indicator="15.6.1")
#' @export

get_indicator=function(Country="578", indicator="1.1.1"){
  url<-paste0("https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?indicator=", indicator,"&areaCode=", Country)
  datcall <- jsonlite::fromJSON(url)
  page<-as.data.frame(datcall$data)
  return(page)
}
