library(shiny)
load("consume.Rdata")

server <- shinyServer(function(input, output){
  output$clplot <- renderPlot({
    d <- dist(consume[, -1], method = input$method1)
    hc <- hclust(d, method = input$method2)
    if(input$lab == TRUE){
      plot(hc, hang = -1,
           labels = consume[, 1])
    } else {
    plot(hc, hang = -1)
    }
    rect.hclust(hc, k = input$num, 
                border = rainbow(input$num))
  })
})
