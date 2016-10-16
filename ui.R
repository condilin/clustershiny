library(shiny)

ui <- shinyUI(fluidPage(
  titlePanel(h2("Consumption level")),
  sidebarLayout(
     sidebarPanel(
      selectInput(
        inputId = "method1",
        label = "Choose sample distance",
        choices = c("euclidean", "maximum", "manhattan",
                    "canberra", "minkowski"),
        selected = "euclidean"),
      selectInput(
        inputId = "method2", 
        label = "Choose class distance",
                  choices = c("single", "median", "complete",
                              "average", "centroid", "ward.D"),
                  selected = "complete"),
    numericInput(
      inputId = "num",
      label = "Cluster count",
      value = 4, min = 2, max = 30, step = 1),
    checkboxInput(
      inputId = "lab",
      label = "Display tag",
      value = FALSE)),
    mainPanel(
      plotOutput(outputId = "clplot")
    )
  )
))
