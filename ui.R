library(shiny)
load("consume.RData")

ui <- shinyUI(fluidPage(
  titlePanel(h3("Consumption Level Cluster Analysis")),
  sidebarLayout(
     sidebarPanel(
       selectInput(
          "clustermethod",
          "Choose cluster method",
         choices = c("Hierarchical", "K-Means"),
         selected = "Hierarchical"),
      conditionalPanel( 
        condition = "input.clustermethod == 'Hierarchical'",
      selectInput(
          "samdismethod",
          "Choose sample distance",
        choices = c("euclidean", "maximum", "manhattan",
                    "canberra", "minkowski"),
        selected = "euclidean"),
      selectInput(
          "cladismethod", 
          "Choose class distance",
                  choices = c("single", "median", "complete",
                              "average", "centroid", "ward.D"),
                  selected = "complete"),
    numericInput(
       "hnum",
       "Cluster count",
      value = 4,
      min = 2, max = 30, step = 1),
    checkboxInput(
       "lab",
       "Display tag",
      value = FALSE)
    ),   
    conditionalPanel(
      condition = "input.clustermethod == 'K-Means'",
      selectInput(
        "Variable1",
        "Select variable1",
        choices = names(consume[-1]),
        selected = names(consume[-1])[1]
      ),
      selectInput(
        "Variable2",
        "Select variable2",
        choices = names(consume[-1]),
        selected = names(consume[-1])[2]
      ),
      numericInput(
         "knum",
         "Cluster count",
        value = 4,
        min = 2, max = 30, step = 1)
      )),
    mainPanel(
      plotOutput(outputId = "hclplot"),
      plotOutput(outputId = "kclplot")   
    ))
))
