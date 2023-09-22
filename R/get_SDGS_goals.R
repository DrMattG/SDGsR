#' Get the SDGs Goals, Targets, and indicators as a dataframe using SDG API v5
#' @description calls the UN SDGs API to get the Goals data
#' @param pathtosave An optional path to save the data as an RDS
#' @return dataframe listing Goals, Targets, and indicators
#' @examples get_SDGs_goals()
#' @import here jsonlite readr
#' @export
#'

get_SDGs_goals <- function(pathtosave = NULL) {
  urls <- c(
    "https://unstats.un.org/sdgs/UNSDGAPIV5/swagger/v1/swagger.json"
  )

  # Read the Swagger documentation to find the endpoints for Goals, Targets, and Indicators
  swagger_doc <- jsonlite::fromJSON(urls[1])
  goal_endpoint <- swagger_doc$paths$`/v1/sdg/Goal`$get$parameters[[2]]$schema$items$enum[1]
  target_endpoint <- swagger_doc$paths$`/v1/sdg/Goal/{id}/Target/List`$get$parameters[[1]]$schema$items$enum[1]

  # Fetch Goals data
  goals_url <- "https://unstats.un.org/sdgs/UNSDGAPIV5/goal"
  goals_data <- jsonlite::fromJSON(goals_url)

  # Fetch Targets data
  targets_url <- "https://unstats.un.org/sdgs/UNSDGAPIV5/target"
  targets_data <- jsonlite::fromJSON(targets_url)

  # Combine Goals and Targets data
  data <- dplyr::bind_rows(goals_data$data, targets_data$data)

  # Extract the goal number from the code
  data$goal <- as.integer(gsub("\\D", "", data$code))
  data$title <- NULL

  if (is.null(pathtosave)) {
    return(data)
  } else {
    readr::write_rds(data, file.path(pathtosave, "SDGS_all.rds"))
    print(paste0("'SDGS_all.rds' saved to ", pathtosave))
  }
}

# Example usage:
# sdgs_data <- get_SDGs_goals()


Goals2 <- get_SDGs_goals()

