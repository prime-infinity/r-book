library(dplyr)
library(shiny)
library(shinydashboard)


# Load chapter files
source("chapters/chapter1.R")
source("chapters/chapter2.R")
source("chapters/chapter3.R")

# Define the UI for the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Ofatunde's book"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Chapter 1", tabName = "chapter1"),
      menuItem("Chapter 2", tabName = "chapter2"),
      menuItem("Chapter 3", tabName = "chapter3")
      # Add more menu items as needed
    )
  ),
  
  dashboardBody(
    tabItems(
      # Chapter 1
      tabItem(tabName = "chapter1", chapter1_ui),
      
      # Chapter 2
      tabItem(tabName = "chapter2", chapter2_ui),
      
      # Chapter 3
      tabItem(tabName = "chapter3", chapter3_ui)
      # Add more tabItems as needed
    )
  )
)

# Define the server logic for the Shiny app
server <- function(input, output, session) {
  # Chapter 1
  chapter1_server(input, output, session)
  
  chapter2_server(input, output, session)
  
  chapter3_server(input, output, session)
  # Add more server logic as needed
}

# Run the Shiny app
shinyApp(ui, server)
