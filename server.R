library(shiny)
library(plotly)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste("MPG vs ", input$variable)
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$mpgPlot <- renderPlot({
        ggplot(mpgData, aes_string(y=input$variable, x="mpg")) + geom_point(colour = "red", size = 3) + theme(text = element_text(size = 30)) 
       
    })
    
})