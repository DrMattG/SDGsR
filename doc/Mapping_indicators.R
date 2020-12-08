## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ---- message=FALSE-----------------------------------------------------------
library(SDGsR)
library(tidyverse)
library(plotly)
library(shiny)

## -----------------------------------------------------------------------------
Ind_15.6.1<-get_indicator_data(indicator = '15.6.1')
Ind_15.9.1<-get_indicator_data(indicator = '15.9.1')
Ind_15.a.1<-get_indicator_data(indicator = '15.a.1')


## ---- message= FALSE----------------------------------------------------------
Ind_15.6.1<-Ind_15.6.1 %>% 
  group_by(seriesDescription, geoAreaName) %>% 
  select(geoAreaName, timePeriodStart,value, seriesDescription, geoAreaCode)
Ind_15.9.1<-Ind_15.9.1 %>% 
  group_by(seriesDescription, geoAreaName) %>% 
  select(geoAreaName, timePeriodStart,value, seriesDescription, geoAreaCode)
Ind_15.a.1<-Ind_15.a.1 %>% 
  group_by(seriesDescription, geoAreaName) %>% 
  select(geoAreaName, timePeriodStart,value, seriesDescription, geoAreaCode)
Ind_15_data=rbind(Ind_15.6.1,Ind_15.9.1, Ind_15.a.1)
Ind_15_data$Indicator=c(rep("Ind_15.6.1", dim(Ind_15.6.1)[1]), rep("Ind_15.9.1", dim(Ind_15.9.1)[1]), rep("Ind_15.a.1", dim(Ind_15.a.1)[1]))

Ind_15_data %>%
  head(4) %>% 
  kableExtra::kable()


## -----------------------------------------------------------------------------
data("lookup_country_codes")

Ind_15_data %>% 
  mutate(region=tolower(geoAreaName)) %>% 
  mutate(value=as.numeric(value))->mapp_data

mapp_data=mapp_data %>% 
  full_join(lookup_country_codes, copy=FALSE,by=c("geoAreaName"="country_or_area")) %>% 
  select(iso_alpha3_code, geoAreaName, value, seriesDescription, Indicator, timePeriodStart) %>% 
  drop_na(iso_alpha3_code) %>%
  drop_na(Indicator)


## -----------------------------------------------------------------------------
p<-mapp_data %>% 
  filter(Indicator=="Ind_15.6.1") %>%
  filter(seriesDescription=="Countries that are contracting Parties to the International Treaty on Plant Genetic Resources for Food and Agriculture (PGRFA) (1 = YES; 0 = NO)") %>% 
  drop_na(iso_alpha3_code) %>% 
  plot_geo() %>% add_trace(
  z = ~value, frame= ~timePeriodStart,color = ~value, colors = 'Oranges',
  text = ~geoAreaName, locations = ~iso_alpha3_code) %>% layout(title="Countries that are contracting Parties to PGRFA (1 = YES; 0 = NO)")
p

# To save the plot locally as a html uncomment the following lines
#library(htmlwidgets)
#saveWidget(p, "p1.html", selfcontained = T, libdir = "lib")


## ---- echo=TRUE---------------------------------------------------------------

shinyApp(

  ui = fluidPage(
    selectInput("Indi", "Indicator:",
                choices = unique(mapp_data$Indicator)),
    selectInput("Seri", "Series:", choices=(unique(mapp_data$seriesDescription))),
    selectInput("Yr", "Year:", choices=(unique(mapp_data$timePeriodStart))),
  plotlyOutput("Plot1")
  ),

  server = function(input, output,session) {
    data1=reactive({
      mapp_data %>% 
        filter(Indicator==input$Indi) 
        
    })
    observeEvent(input$Indi,{
      updateSelectInput(session, "Seri",choices=(unique(data1()$seriesDescription)))
    })
    data2=reactive({
     filter(data1(),seriesDescription==input$Seri)
        })
    observeEvent(input$Seri,{
      updateSelectInput(session, "Yr",choices=(unique(data2()$timePeriodStart)))
      })
    
    data3=reactive({
        filter(data2(),timePeriodStart==input$Yr)
      })
    output$Plot1 = renderPlotly({
      plot_geo(data3()) %>% add_trace(
  z = ~value, color = ~value, colors = 'Oranges',
  text = ~geoAreaName, locations = ~iso_alpha3_code)

    })
  },

  options = list(height = 500)
)

