library(dplyr)
library(shiny)
library(shinydashboard)


# Load chapter files
source("chapters/chapter1.R")
source("chapters/chapter2.R")
source("chapters/chapter4.R")
source("chapters/chapter5.R")
source("chapters/chapter6.R")
source("chapters/chapter3.R")

# Define the UI for the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Ofatunde's book"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "Introduction"),
      menuItem("Context", tabName = "Context"),
      menuItem("Proposed-Solution", tabName = "Proposed-Solution"),
      menuItem("Methods", tabName = "Methods"),
      menuItem("Results", tabName = "Results"),
      menuItem("Chapter 3", tabName = "chapter3")
      # Add more menu items as needed
    )
  ),
  
  dashboardBody(
    tabItems(
      # Chapter 1
      tabItem(tabName = "Introduction", chapter1_ui),
      
      # Chapter 2
      tabItem(tabName = "Context", chapter2_ui),
        
      # Chapter 3
      tabItem(tabName = "Proposed-Solution", chapter4_ui),
      
      # Chapter 4
      tabItem(tabName = "Methods", chapter5_ui),
      
      # Chapter 5
      tabItem(tabName = "Results", chapter6_ui),
      
      # Chapter 3
      tabItem(tabName = "chapter3", chapter3_ui)
      # Add more tabItems as needed
    )
  )
)

# Define the server logic for the Shiny app
server <- function(input, output, session) {
  # Chapter 1
  #chapter1_server(input, output, session)
  
  
  chapter3_server(input, output, session)
  # Add more server logic as needed
}

# Run the Shiny app
shinyApp(ui, server)
