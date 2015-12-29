library(shiny)

shinyUI(navbarPage("Twitter",
                   tabPanel("Hashtag",
                            fluidPage(

                              sidebarLayout(
                                sidebarPanel(
                                  textInput("hashtag", "HashTag"),
                                  textInput("count", "Maximum Tweets"),
                                  actionButton("dispByHt", "Submit"),
                                  width = 3
                                ),


                                mainPanel(
                                  tableOutput("tweets"))
                              )


                            )
                   ),
                   tabPanel("User Timeline",
                            sidebarLayout(
                              sidebarPanel(
                                textInput("username", "User Name"),
                                textInput("counter", "Maximum Tweets"),
                                width = 3
                              ),


                              mainPanel(
                                tableOutput("userinfo"),
                                tableOutput("usertweets")
                              )


                            ))
))
