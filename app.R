library(dplyr)
library(shiny)
library(shinydashboard)
library(RefManageR)



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
source("chapters/chapter5-6.R")
source("chapters/chapter6-1.R")
source("chapters/chapter6-2.R")
source("chapters/chapter3.R")

# Define the UI for the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Ofatunde's book"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "Introduction"),
      menuItem("1.Context", tabName = "Context"),
      
      menuItem("2.Proposed-Solution", tabName = "Proposed-Solution",
               menuSubItem("2.1 Dataset-level outputs", tabName = "Dataset-level"),
               menuSubItem("2.2 Library-level outputs", tabName = "Library-level")
      ),
      menuItem("3.Methods", tabName = "Methods",
               menuSubItem("3.1 Tools", tabName = "tools"),
               menuSubItem("3.2 Citations", tabName = "citations"),
               menuSubItem("3.3 Query Generation", tabName = "query-generation"),
               menuSubItem("3.4 Semantic Search", tabName = "semantic-search"),
               menuSubItem("3.5 Topic Modeling and Sentiment Analysis", tabName = "topic-modeling"),
               menuSubItem("3.6 Network Analysis", tabName = "network-analysis")
      ),
      menuItem("4.Results", tabName = "Results",
               menuSubItem("4.3. Model Output", tabName = "model-output"),
               menuSubItem("4.4. Evaluation Model Performance", tabName = "model-performance")
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
      tabItem(tabName = "topic-modeling", chapter5_5_ui),
      tabItem(tabName = "network-analysis", chapter5_6_ui),
      
      
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
  chapter3_server(input, output, session)
  # Add more server logic as needed
}

# Run the Shiny app
shinyApp(ui, server)
