library(shiny)
library(tidyverse)
library(academictwitteR)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title="External Evidence- CPA Australia"),

  dashboardSidebar(
#menu
      sidebarMenu(
      menuItem("Evidence collection",
               tabName="collection",
               icon=icon("dashboard")),
      menuItem("Evidence evaluation",
               tabName="evaluation",
               icon=icon("dashboard")),
      menuItem("Guidance",
               tabName="guidance",
               icon=icon("dashboard"))
    )
  ),


#body
  dashboardBody(
    tabItem(tabName="collection",
            box(textInput("searchTerm", "", value="Enter your search term"),
                textInput("excludeAccount", "Enter twitter account to exclude (e.g.@ANZ_NZ) - one per box"),
                dateRangeInput("searchDates", label="Search dates", start="2018-01-01", end=Sys.time())
            ),
#            box(textInput("excludeAccount", "Enter twitter account to exclude (e.g.@ANZ_NZ) - one per box")),
            box(tableOutput("top_10_table"))

            ),
    tabItem(tabName="evaluation"
            ),
    tabItem(tabName="guidance")
  )
)
 # textInput("searchTerm", "", value="Enter your search term"),

 # textInput("excludeAccount", "Enter twitter account to exclude (e.g.@ANZ_NZ) - one per box"),

 # actionButton("search", "Search", icon = icon("twitter"), class = "btn-sm btn-primary"),

 # dateRangeInput("searchDates", label="Search dates", start="2018-01-01", end=Sys.time())

 # selectInput language

 # selectInput location

#  tickbox

server <- function(input, output, session) {

  product<-reactive({
    input$x * input$y
  })


  output$product <- renderText({
#    product <- input$x * input$y
#    product

    product()
  })
  output$product_plus5 <- renderText({
#    product <- input$x * input$y
#    product + 5
    product()+5
  })
  output$product_plus10 <- renderText({
 #   product <- input$x * input$y
#    product + 10
    product()+10
  })
}

shinyApp(ui, server)
