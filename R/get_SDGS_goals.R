#' get_SDGS_goals
#' @description calls the UN SDGs API to get the Goals data
#' @return writes an .RDS file to a "data" folder listing Goals, Targets and indicators
#' @examples get_SDGs_goals()
#' @export

get_SDGs_goals<-function(){
  #all goals
  url1<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/1/Target/List?includechildren=true")
  url2<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/2/Target/List?includechildren=true")
  url3<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/3/Target/List?includechildren=true")
  url4<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/4/Target/List?includechildren=true")
  url5<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/5/Target/List?includechildren=true")
  url6<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/6/Target/List?includechildren=true")
  url7<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/7/Target/List?includechildren=true")
  url8<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/8/Target/List?includechildren=true")
  url9<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/9/Target/List?includechildren=true")
  url10<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/10/Target/List?includechildren=true")
  url11<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/11/Target/List?includechildren=true")
  url12<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/12/Target/List?includechildren=true")
  url13<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/13/Target/List?includechildren=true")
  url14<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/14/Target/List?includechildren=true")
  url15<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/15/Target/List?includechildren=true")
  url16<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/16/Target/List?includechildren=true")
  url17<-c("https://unstats.un.org/SDGAPI/v1/sdg/Goal/17/Target/List?includechildren=true")

  datcall1 <- jsonlite::fromJSON(url1)
  datcall2 <- jsonlite::fromJSON(url2)
  datcall3 <- jsonlite::fromJSON(url3)
  datcall4 <- jsonlite::fromJSON(url4)
  datcall5 <- jsonlite::fromJSON(url5)
  datcall6 <- jsonlite::fromJSON(url6)
  datcall7 <- jsonlite::fromJSON(url7)
  datcall8 <- jsonlite::fromJSON(url8)
  datcall9 <- jsonlite::fromJSON(url9)
  datcall10 <- jsonlite::fromJSON(url10)
  datcall11 <- jsonlite::fromJSON(url11)
  datcall12 <- jsonlite::fromJSON(url12)
  datcall13 <- jsonlite::fromJSON(url13)
  datcall14 <- jsonlite::fromJSON(url14)
  datcall15 <- jsonlite::fromJSON(url15)
  datcall16 <- jsonlite::fromJSON(url16)
  datcall17 <- jsonlite::fromJSON(url17)

  df1<-data.frame(datcall1$targets)
  df2<-data.frame(datcall2$targets)
  df3<-data.frame(datcall3$targets)
  df4<-data.frame(datcall4$targets)
  df5<-data.frame(datcall5$targets)
  df6<-data.frame(datcall6$targets)
  df7<-data.frame(datcall7$targets)
  df8<-data.frame(datcall8$targets)
  df9<-data.frame(datcall9$targets)
  df10<-data.frame(datcall10$targets)
  df11<-data.frame(datcall11$targets)
  df12<-data.frame(datcall12$targets)
  df13<-data.frame(datcall13$targets)
  df14<-data.frame(datcall14$targets)
  df15<-data.frame(datcall15$targets)
  df16<-data.frame(datcall16$targets)
  df17<-data.frame(datcall17$targets)


  data<-dplyr::bind_rows(df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12,df13,df14,df15,df16,df17)
  data$goal<-stringi::stri_extract_first_regex(data$code, "[0-9]+")
  data$title<-NULL
  path=paste0(here::here(),"SDGS_all.rds")
  readr::write_rds(data, path=path)

}
