#' SDGS colour pallette
#' @description get the SDGS colour for each Goal
#' @return hex colour for each Goal
#' @examples
#' library(SDGsR)
#' library(tidyverse)
#' Norway <- get_indicator(Country = "578", indicator = "15.4.1")
#' Norway %>%
#'   select(timePeriodStart, value, seriesDescription) %>%
#'   ggplot(aes(timePeriodStart, value)) +
#'   geom_point(colour = SDGs_cols("Goal15")) +
#'   ggtitle(label = paste0(Norway$seriesDescription[1]))
#' @export
SDGs_cols <- function(...) {
  SDGs_colours <- c(
    "Goal1" = "#E5243B",
    "Goal2" = "#DDA63A",
    "Goal3" = "#4C9F38",
    "Goal4" = "#C5192D",
    "Goal5" = "#FF3A21",
    "Goal6" = "#26BDE2",
    "Goal7" = "#FCC30B",
    "Goal8" = "#A21942",
    "Goal9" = "#FD6925",
    "Goal10" = "#DD1367",
    "Goal11" = "#FD9D24",
    "Goal12" = "#BF8B2E",
    "Goal13" = "#3F7E44",
    "Goal14" = "#0A97D9",
    "Goal15" = "#56C02B",
    "Goal16" = "#00689D",
    "Goal17" = "#19486A"
  )
  cols <- c(...)
  if (is.null(cols)) {
    return(SDGs_colours)
  }

  SDGs_colours[cols]
}
