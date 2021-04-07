mapp_data=get_indicator_example_data()
shinyApp(
  ui = fluidPage(
    selectInput("Indi", "Indicator:",
                choices = unique(mapp_data$Indicator)),
    selectInput("Seri", "Series:", choices=(unique(mapp_data$seriesDescription))),
    selectInput("Yr", "Year:", choices=(unique(mapp_data$timePeriodStart))),
    plotly::plotlyOutput("Plot1")
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
    output$Plot1 = plotly::renderPlotly({
      plotly::plot_geo(data3()) %>% plotly::add_trace(
        z = ~value, color = ~value, colors = 'Oranges',
        text = ~geoAreaName, locations = ~iso_alpha3_code)

    })
  },
      options = list(height = 500)
)
