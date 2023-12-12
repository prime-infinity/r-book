library(dplyr)
library(shiny)
library(shinydashboard)


# Load chapter files
source("chapters/chapter1.R")
source("chapters/chapter2.R")
source("chapters/chapter4-1.R")
source("chapters/chapter4-2.R")
source("chapters/chapter5-1.R")
source("chapters/chapter5-2.R")
source("chapters/chapter5-3.R")
source("chapters/chapter5-4.R")
source("chapters/chapter5-5.R")
source("chapters/chapter6-1.R")
source("chapters/chapter6-2.R")
source("chapters/chapter3.R")

# Define the UI for the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Ofatunde's book"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "Introduction"),
      menuItem("Context", tabName = "Context"),
      
      menuItem("Proposed-Solution", tabName = "Proposed-Solution",
               menuSubItem("Dataset-level outputs", tabName = "Dataset-level"),
               menuSubItem("Library-level outputs", tabName = "Library-level")
      ),
      menuItem("Methods", tabName = "Methods",
               menuSubItem("Tools", tabName = "tools"),
               menuSubItem("Citations", tabName = "citations"),
               menuSubItem("Query Generation", tabName = "query-generation"),
               menuSubItem("Semantic Search", tabName = "semantic-search"),
               menuSubItem("Network Analysis", tabName = "network-analysis")
      ),
      menuItem("Results", tabName = "Results",
               menuSubItem("Model Output", tabName = "model-output"),
               menuSubItem("Evaluation Model Performance", tabName = "model-performance")
      ),
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
      tabItem(tabName = "Dataset-level",chapter4_1_ui),
      tabItem(tabName = "Library-level",chapter4_2_ui),
      
      # Chapter 4
      tabItem(tabName = "tools", chapter5_1_ui),
      tabItem(tabName = "citations", chapter5_2_ui),
      tabItem(tabName = "query-generation", chapter5_3_ui),
      tabItem(tabName = "semantic-search", chapter5_4_ui),
      tabItem(tabName = "network-analysis", chapter5_5_ui),
      
      
      # Chapter 5
      tabItem(tabName = "model-output", chapter6_1_ui),
      tabItem(tabName = "model-performance", chapter6_2_ui),
      
      
      
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
