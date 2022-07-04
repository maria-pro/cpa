library(shiny)
library(tidyverse)
library(academictwitteR)
library(shinydashboard)
library(DT)

library(httr)
library(rtweet)
library(jsonlite)

#if (!exists("data")){
#  data<-vroom::vroom("data/lactose.csv")%>%
    data<-read_csv("data/lactose.csv")%>%
    select(user_username, text, created_at )
#}

shinyApp(ui, server, options=list(port=80L))
