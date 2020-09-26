library(shiny)
library(shinydashboard)

ui = dashboardPage(
  header = dashboardHeader(),
  sidebar = dashboardSidebar(
    sidebarMenu(
      menuItem("Tab 1", tabName = "tab1"),
      menuItem("Tab 2", tabName = "tab2")
    )
  ),
  
  body = dashboardBody(
    
    tabItems(
      tabItem(tabName = "tab1",
              box(width = 6, height = "80vh", title = "Demo",
                  status = "warning", solidHeader = TRUE,
                  h2("Some text here"),
                  pulloutPanel(position = "right", 
                               h2("Right Panel", style = "text-align: center;"),
                               handleStyle = handleStyle(width = "15px",
                                                         backgroundColor = "orange"),
                               width = "100%", top = "40px"),
              ),
              pulloutPanel(position = "right", 
                           h2("Right panel on tab"),
                           handleStyle = handleStyle(backgroundColor = "red"),
                           top = "50px")
      ),
      
      tabItem(tabName = "tab2",
              pulloutPanel(position = "left", 
                           h2("Left Panel", style = "text-align: center;"),
                           handleStyle = handleStyle(width = "10px"),
                           top = "50px")
      )
    )
  )
)
server = function(input, output, sesion) {}

shinyApp(ui, server)
