#' Get the titles of the SDGS goals
#' @description calls the UN SDGs API to get the titles for each Goal
#' @return dataframe of goal titles
#' @import here jsonlite readr
#' @export

get_SDGs_goals_titles<-function(){
url1<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/List?includechildren=true")
datcall1 <- jsonlite::fromJSON(url1)
titles<-data.frame(datcall1$title)
return(titles)
}
