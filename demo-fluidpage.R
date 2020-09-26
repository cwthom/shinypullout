library(shiny)
source("pulloutPanel.R")

runApp(
  shinyApp(
    ui = fluidPage(
      h1("Pullout Panels - FluidPage"),
      
      pulloutPanel(position = "right", 
                   h2("Right Panel", style = "text-align: center;"),
                   handleStyle = handleStyle(backgroundColor = "forestgreen",
                                             color = "white",
                                             height = "100px"),
                   handleText = "Tab 1"),
      
      pulloutPanel(position = "right",
                   h2("Right Panel 2", style = "text-align: center;"),
                   handleStyle = handleStyle(backgroundColor = "purple",
                                             color = "white",
                                             height = "100px",
                                             top = "100px"),
                   handleText = "Tab 2"),
                   
      pulloutPanel(position = "left", 
                   h2("Left Panel", style = "text-align: center;"),
                   handleStyle = handleStyle(width = "15px", 
                                             backgroundColor = "dodgerblue",
                                             color = "white"),
                   handleText = "Tab on the left with a longer name",
                   width = "700px")
    ),
    server = function(input, output, sesion) {}
  )
)
