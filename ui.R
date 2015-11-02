
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
require(rCharts)
shinyUI(fluidPage(

  # Application title
  titlePanel("Income Calculator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("market_returns",
                  "Market Returns:",
                  min = 0.05,
                  max = 0.12,
                  value = 0.1,
                  step = 0.01),
      
      sliderInput("lumps",
                  "Lump Payment:",
                  min = 300000,
                  max = 600000,
                  value = 500000,
                  step = 50000),
      
      sliderInput("rents",
                  "Monthly Rent",
                  min = 2000,
                  max = 3500,
                  value = 2500,
                  step = 500),
      
      sliderInput("rent_incr",
                  "Yearly Rent Increase %",
                  min = 0,
                  max = 0.05,
                  value = 0.01,
                  step = 0.01)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      showOutput("myChart", lib = "morris")
    )
  )
))
