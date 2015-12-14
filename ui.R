

# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Twitter Search"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("hashtag", "HashTag"),
      textInput("count", "Maximum Tweets"),
      submitButton(text = "Submit")
    ),
    mainPanel(tableOutput("tweets"))
  )
  
  
))
