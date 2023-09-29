#' Get a list of indicators of each Goal (and target)
#' @description get a list of the indicators for each goal and target
#' @return A dataframe of indicators and the description
#' @examples require(SDGsR)
#' get_indicator_list()
#' @export


get_indicator_list <- function() {
  url <- c("https://unstats.un.org/sdgs/UNSDGAPIV5/v1/sdg/Indicator/List")
  datcall <- jsonlite::fromJSON(url)

  indicators <- data.frame(
    goal = datcall$goal,
    target = datcall$target,
    code = datcall$code,
    description = datcall$description
  )
  return(indicators)
}

indicator_list <- get_indicator_list()
