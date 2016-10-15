library(shiny)

ui <- shinyUI(fluidPage(
  titlePanel(h2("Clust")),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "method", 
        label = "Choose Clust Method",
                  choices = c("single", "complete", "average"),
                  selected = "single")),
    mainPanel(
      plotOutput(outputId = "clplot")
    )
  )
))