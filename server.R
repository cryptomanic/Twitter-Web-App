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
    if (is.null(data$id)) {
      data <- userInfo(token, "narendramodi")
    }
    pic <- profile_pic
    if (! is.null(pic)) cbind(pic = as.character(img(src = pic)), data.frame(data))
  },  sanitize.text.function = function(x) x)

  output$usertweets <- renderTable({
    data <- userTweets(token, input$username, count = input$counter)
    if (length(data) == 0) {
      data <- userTweets(token, "narendramodi")
    }
    data.frame(`Recent Tweets` = data)
  })

})
