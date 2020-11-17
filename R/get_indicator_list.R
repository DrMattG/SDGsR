#' get_indicator_list
#' @description get a list of the indicators for each goal and target
#' @return A dataframe of indicators and the description
#' @examples get_indicator_list()
#' @export


get_indicator_list<-function(){
url<-c("https://unstats.un.org/SDGAPI/v1/sdg/Indicator/List")
datcall <- jsonlite::fromJSON(url)

indicators<-data.frame(goal=datcall$goal,
                      target=datcall$target,
                      code=datcall$code,
                      description=datcall$description)
return(indicators)
}
