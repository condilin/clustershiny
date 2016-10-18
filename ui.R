library(shiny)
load("consume.RData")

ui <- shinyUI(fluidPage(
  titlePanel(h2("Consumption level")),
  sidebarLayout(
     sidebarPanel(
       selectInput(
         inputId = "clustermethod",
         label = "Choose cluster method",
         choices = c("Hierarchical", "K-Means"),
         selected = "Hierarchical"),
      conditionalPanel( 
        condition = "input.clustermethod == 'Hierarchical'",
      selectInput(
        inputId = "samdismethod",
        label = "Choose sample distance",
        choices = c("euclidean", "maximum", "manhattan",
                    "canberra", "minkowski"),
        selected = "euclidean"),
      selectInput(
        inputId = "cladismethod", 
        label = "Choose class distance",
                  choices = c("single", "median", "complete",
                              "average", "centroid", "ward.D"),
                  selected = "complete"),
    numericInput(
      inputId = "hnum",
      label = "Cluster count",
      value = 4,
      min = 2, max = 30, step = 1),
    checkboxInput(
      inputId = "lab",
      label = "Display tag",
      value = FALSE)
    ),   
    conditionalPanel(
      condition = "input.clustermethod == 'K-Means'",
      selectInput(
        inputId = "Variable1",
        label = "Select variable1",
        choices = names(consume[-1]),
        selected = names(consume[-1])[1]
      ),
      selectInput(
        inputId = "Variable2",
        label = "Select variable2",
        choices = names(consume[-1]),
        selected = names(consume[-1])[2]
      ),
      numericInput(
        inputId = "knum",
        label = "Cluster count",
        value = 4,
        min = 2, max = 30, step = 1)
      )),
    mainPanel(
      plotOutput(outputId = "hclplot"),
      plotOutput(outputId = "kclplot")
      
    ))
))
