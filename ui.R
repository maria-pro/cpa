library(shiny)
library(tidyverse)
library(academictwitteR)
library(shinydashboard)
library(DT)

library(httr)
library(rtweet)
library(jsonlite)

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

#------------------------
  #body
  dashboardBody(
    #link css
    tags$head(
      tags$link(rel="sttylesheet", type="text/css", href="custom.css")
    ),

    #------------------------

    #tab 1
    tabItem(tabName="collection",
#first row with search settings
            fluidRow(

# main settings box
              box(
                title="Setup", width=4, status="primary", solidHeader=TRUE,
 #               textOutput("rv", "this is reactive value"),



                verbatimTextOutput("test", placeholder=TRUE),

#temporary input file
                fileInput('datafile',
                          "Choose the company file to use",
                          accept=c('text/csv', 'text/comma-separated-values, text/plain')),


                helpText("Provide a key term to search. Do not include #"),

                textInput(inputId="user",
                          label="Keyword",
                          value="Twitter User or Hashtag:"),
                radioButtons("type", "Search type:",
                             c("User" = "user2",
                               "Hashtag" = "hashtag")),
                actionButton("newUser", "Generate user"),

                actionButton("newHashtag", "Generate hashtag"),


                hr(),

                textInput("excludeAccount", "Enter twitter account to exclude (e.g.@ANZ_NZ) - one per box"),

                dateRangeInput("searchDates", label="Search dates", start="2018-01-01", end=Sys.time()),

                actionButton("update", "Gather data")

              ),
              #additional settings for search
              box(
                title="Additional settings", status="primary", width=6,

                helpText("Language of tweets and country"),

                selectInput("lang",
                            label="",
                            choices=c("ar",
                                      "de",
                                      "en",
                                      "es",
                                      "fr",
                                      "id",
                                      "it",
                                      "jp",
                                      "ro",
                                      "ru",
                                      "sv",
                                      "th",
                                      "zh"),
                            selected="en",
                            width="20%"),


                selectInput("country",
                            label="",
                            choices=c("ar",
                                      "de",
                                      "en",
                                      "es",
                                      "Australia"),

                            selected="Australia",
                            width="20%"),



                sliderInput("tws", "Maximum number of tweets to obtain:",
                            min=100, max= 500, value=250, step = 1),
                sliderInput("numWords", "Words in bar graph:",
                            min=1, max= 35, value=10, step = 1),
                sliderInput("max",
                            "Size of wordcloud:",
                            min = 5,  max = 100, value = 50, step = 5),
                actionButton("newCloud", "Generate new wordcloud")
              )

            ),

#second row with results of the search

            fluidRow(
              #next column  - Results
              box(
                title="Results", status="info", solidHeader=TRUE,

                dataTableOutput("table"),
                dataTableOutput("results"),
              )


            ),
            tabItem(tabName="evaluation"),
            tabItem(tabName="guidance"),
    )
  )
)

# textInput("searchTerm", "", value="Enter your search term"),

# textInput("excludeAccount", "Enter twitter account to exclude (e.g.@ANZ_NZ) - one per box"),

# actionButton("search", "Search", icon = icon("twitter"), class = "btn-sm btn-primary"),

# dateRangeInput("searchDates", label="Search dates", start="2018-01-01", end=Sys.time())

# selectInput language

# selectInput location

#  tickbox


#------------------------
