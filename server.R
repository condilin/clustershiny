library(shiny)
require(graphics) 
load("consume.RData")

server <- shinyServer(function(input, output){
  output$hclplot <- renderPlot({
    if(input$clustermethod == "Hierarchical"){
    d <- dist(consume[-1], method = input$samdismethod)
    hc <- hclust(d, method = input$cladismethod)
    if(input$lab == TRUE){
      plot(hc, hang = -1,
           labels = consume[, 1])
    } else {
    plot(hc, hang = -1)
    }
    rect.hclust(hc, k = input$hnum, border = rainbow(input$hnum))
    } else {
     km <- kmeans(consume[-1], centers = input$knum)
     consume_1 <- consume[-1]
     plot(consume_1[, c(input$Variable1, input$Variable2)], 
          col = km$cluster, pch = km$cluster)
     points(km$centers[, c(input$Variable1, input$Variable2)], 
            col = 1:input$knum, pch = 8, cex = 3)
    }   
  })
})
