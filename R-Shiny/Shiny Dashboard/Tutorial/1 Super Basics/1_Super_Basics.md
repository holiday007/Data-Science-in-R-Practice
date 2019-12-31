Shiny Dashboard - Super Basics
================
Author: Holiday Tang  
[LinkeDin](https://www.linkedin.com/in/holiday-t/) |
[GitHub](https://github.com/holiday007) | [Kaggle
Novice](https://www.kaggle.com/holibae007)
| Date: 2019-12-30

  - [Basics](#basics)
      - [Blank Dashboard](#blank-dashboard)
      - [Let’s add some elements](#lets-add-some-elements)

# Basics

A dashboard has three parts: a header, a sidebar, and a body. Here’s the
most minimal possible UI for a dashboard page.

``` r
## ui.R ##
library(shinydashboard)

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)
```

### Blank Dashboard

``` r
## app.R ##
library(shiny)
library(shinydashboard)

ui = dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

server = function(input, output){}

shinyApp(ui, server)
```

### Let’s add some elements

#### Adding title to header

``` r
## app.R ##
ui = dashboardPage(
  dashboardHeader(title = "Basic Dashboard"), # adding title
  dashboardSidebar(),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    
    ############### First Row ###############
    fluidRow(
      ### column 1 ###
      box(plotOutput("plot1", height = 250)),
      
      ### column 2 ###
      box(
        title = "Controls",
        sliderInput("slider", "Number of observations:", 1, 100, 50)
      )
    )
  )
)

server = function(input, output){
  set.seed(101)
  
  output$plot1 = renderPlot({
    data = rnorm(input$slider)
    hist(data)
  })
}

shinyApp(ui, server)
```
