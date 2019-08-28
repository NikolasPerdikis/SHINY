library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Unemployment"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderPOP","Slide to change population estimate! (population in thousands)",105,125,value=115),
            checkboxInput("showModel1","Show/Hide Linear Model",value=TRUE),
            submitButton("Submit")
        ),
        mainPanel(
            tabsetPanel(type="tabs",
            tabPanel("Help",br(),h4("Welcome to the application!"),br(), "Use the slider to change population value",br(),
                       "You may choose to check/uncheck the Linear Model display",br(), 
                     "Click on Submit to finalize your choices and let the app do server side calculations",br(),
                     "You may return to the slider to do further calculations as desired." ,br(), 
                    h4("Last, click on the Output tab to display the results.")),
           tabPanel("Output" ,
            plotOutput("plot1"),
            h3("Predicted Unemployment from Model:"),
            textOutput("pred1"))
        )
        )
    )
))
