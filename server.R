
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)
library(rCharts)
source('functions.R')
source('make_data.R')
shinyServer(function(input, output) {

  output$myChart <- renderChart({
    market_returns <- input$market_returns
    lumps <- input$lumps
    rents <- input$rents
    rent_inc = input$rent_incr
    
    # get return values
    lr <- which(lump_params$lumps == lumps & lump_params$returns == market_returns ) 
    mr <- which(month_params$rents == rents & month_params$returns == market_returns & month_params$rent_incr == rent_inc )
    df <- data.frame(years = 1:35, 
                     lump = lump_outcomes[, lr],
                     rent = month_outcomes[, mr]
    )

    df$dates <- as.character(seq.Date(from = as.Date('2016-01-01'), by = 'year', length.out = 35))
    m1 <- mPlot(x = "dates", y = c("lump", "rent"), type = "Line", data = df)
    m1$set(pointSize = 0, lineWidth = 1)
    m1$set(lineColors = c('blue', 'red'))
    m1$addParams(dom = 'myChart')
    return(m1)
    })
})

# 