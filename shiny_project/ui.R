library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Unemployment"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderPOP","Slide to change population estimate! (in 100K units)",105,125,value=115),
            checkboxInput("showModel1","Show/Hide Linear Model",value=TRUE),
            submitButton("Submit")
        ),
        mainPanel(
            tabsetPanel(type="tabs",
            tabPanel("Help",br(),"Welcome to the application. Use slider above to change population value
                     and check/uncheck the Linear Model display, then click on Submit. Next, 
                     click on the Output tab to display the results.") ,           
            tabPanel("Output" ,
            plotOutput("plot1"),
            h3("Predicted Unemployment from Model:"),
            textOutput("pred1"))
        )
        )
    )
))
