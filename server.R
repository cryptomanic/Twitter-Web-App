
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(tweeteR)

shinyServer(function(input, output) {
  
  key     <- readline("Enter your API Key : ")
  secret  <- readline("Enter your API Secret : ")
  token   <- tweetOauth(key, secret)
  
  token <- tweetOauth(key, secret)
  
  output$tweets <- renderTable({
    input$dispByHt
    isolate({
      data <- hashTag(token, input$hashtag, input$count)
      img_urls<- vector("character")
      
      for(url in img_profile) {
        img_urls <- append(img_urls, as.character(img(src = url)))
      }
      
      cbind(pic = img_urls, data[,-1])
    })
    
  }, sanitize.text.function = function(x) x)
  
  output$userinfo <- renderTable({
    data <- userInfo(token, input$username)
    pic <- profile_pic
    if (! is.null(pic)) cbind(pic = as.character(img(src = pic)), data.frame(data))
  }, sanitize.text.function = function(x) x)
  
})
