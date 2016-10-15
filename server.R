library(shiny)
server <- shinyServer(function(input, output){
  output$clplot <- renderPlot({
    d <- dist(consume)
    plot(hclust(d, method = input$method), 
            hang = -1)
  })
})
