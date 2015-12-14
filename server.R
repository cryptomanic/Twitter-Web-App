
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(tweeteR)

shinyServer(function(input, output) {
  
  key     <- readline("Enter your API Key : ")
  secret <- readline("Enter your API Secret : ")
  token   <- tweetOauth(key, secret)
  
  output$tweets <- renderTable({
    hashTag(token, input$hashtag, input$count)
  })
})
