library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    model1 <- lm(Unemployed~Population, data=longley)
        model1pred <- reactive({
        POPInput <- input$sliderPOP
        predict(model1,newdata=data.frame(Population=POPInput))
    })
        output$plot1 <- renderPlot({
        POPInput <- input$sliderPOP
        gg <- ggplot(longley, aes(x=Population, y=Unemployed)) +
            geom_point(size=3) + 
            xlim(c(100, 130)) + 
            ylim(c(180, 400)) + 
            labs(subtitle="Simple linear model to display shiny functionality",
                y="Unemployed", 
                 x="Population", 
                 title="Unemployed per Population Size", 
                 caption = "Source: data(longley)")
        
        if(input$showModel1) {
        gg <- gg + geom_abline(slope=model1$coefficients[2],
                               intercept=model1$coefficients[1],color='red',size=2)
        gg <- gg + geom_point(aes(x=POPInput,y=model1pred()),color='orange',size=5) +
            geom_label(aes(POPInput+1,model1pred()-10,label=paste(POPInput,trunc(model1pred(),0),sep=",")))
        }
        
        plot(gg)
        
        
    })
    
    output$pred1 <- renderText({
        trunc(model1pred(),0)
    })
})