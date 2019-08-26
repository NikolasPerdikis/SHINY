library(shiny)
library(miniUI)

myFirstGadget <- function() {
    ui <- miniPage(
        gadgetTitleBar("Nikisek's First Gadget")
    )
    server <- function(input, output, session) {
        # The Done button closes the app
        observeEvent(input$done, {
            stopApp()
        })
    }
    runGadget(ui, server)
}

