#' get_country_list
#' @description get a list of the country codes that you can query from the API
#' @return A list of country codes
#' @examples cnts<-get_country_list()[228]
#' @export


get_country_list<-function(){
  data("lookup_country_codes")
  return(unique(lookup_country_codes$country_or_area))
}

#' lookup_country_codes
#' @description Lookup a country code for a country
#' @param code M49 or ISO3 alpha code
#' @param country the name of country
#' (use get_country_list to see the
#' accepted names of countries)
#' @return A M49 or ISO3 alphacode
#' @examples lookup_country(code="M49", country="Norway")
#' @export


lookup_country<-function(code="M49", country){
  data("lookup_country_codes")
  code<-ifelse(code == 'M49',
               lookup_country_codes[which(
                 lookup_country_codes$country_or_area==country),
                 ]$'m49_code',
                      ifelse(code == 'ISO_Alpha3',
                             lookup_country_codes[which(
                               lookup_country_codes$country_or_area==country),
                               ]$'iso_alpha3_code' ,
                             stop(paste0("Please choose either M49 or ISO_Alpha3 "))))
                             return(code)
  }

