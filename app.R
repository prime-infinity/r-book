library(dplyr)
library(ggplot2)
library(rmarkdown)
library(shiny)
library(shinydashboard)
library(RefManageR)
library(reticulate)
library(kableExtra)
py_install("pandas")
library(here)
here::i_am("app.R")



# Load chapter files

source("chapters/Bibliography.R")
source("chapters/chapter3.R")
#source(helperfunctions.R)

# Define the UI for the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Ofatunde's book"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "Introduction"),
      menuItem("1.Context", tabName = "Context"),
      
      menuItem("2.Proposed-Solution", tabName = "Proposed-Solution"),
      
      menuItem("3.Methods", tabName = "Methods"),
      
      menuItem("...", tabName = "Methods2",
               menuSubItem("3.1 Query Generation", tabName = "query-generation"),
               menuSubItem("3.2 Semantic Search", tabName = "semantic-search"),
               menuSubItem("3.3 Topic Modeling", tabName = "topic-modeling"),
               menuSubItem("3.4 Network Analysis", tabName = "network-analysis")
      ),
      menuItem("4.Results", tabName = "Results"),
      
      menuItem("...", tabName = "Results2",
               menuSubItem("4.1. Model Output", tabName = "model-output"),
               menuSubItem("4.2. Evaluation Model Performance", tabName = "model-performance")
      ),
      
      menuItem("5.Implementation Options", tabName = "implementation-options"),
      
      menuItem("6.Case Study: VaSyR 2018", tabName = "case-study"),
      
      menuItem("7.Contributors", tabName = "contributors"),
      
      menuItem("8.Bibliography", tabName = "bibliography"),
      
      menuItem("Chapter 3", tabName = "chapter3")
      # Add more menu items as needed
      
    )
  ),
  
  dashboardBody(
    tabItems(
      
      tabItem(tabName = "Introduction", uiOutput("introTab")),
  
      tabItem(tabName = "Context", uiOutput("contextTab")),
      
      tabItem(tabName = "Proposed-Solution",uiOutput("proposedsolutionTab")),  
      
      tabItem(tabName = "Methods",uiOutput("MethodsTab")),
        tabItem(tabName = "query-generation",uiOutput("querygenerationTab")),
        tabItem(tabName = "semantic-search",uiOutput("semanticsearchTab")),
        tabItem(tabName = "topic-modeling",uiOutput("topicmodelingTab")),
        tabItem(tabName = "network-analysis",uiOutput("networkanalysisTab")),

      tabItem(tabName = "Results",uiOutput("ResultsTab")),
        tabItem(tabName = "model-output",uiOutput("modeloutputTab")),
        tabItem(tabName = "model-performance",uiOutput("modelperformanceTab")),
    
     
      tabItem(tabName = "implementation-options", uiOutput("implementationoptionsTab")),
      
      
      tabItem(tabName = "case-study", uiOutput("casestudyTab")),
      
      
      tabItem(tabName = "contributors", uiOutput("contributorsTab")),
      
      
      tabItem(tabName = "bibliography", chapter10_ui),
      
     
      tabItem(tabName = "chapter3", chapter3_ui)
      
      
    )
  )
)

# Define the server logic for the Shiny app
server <- function(input, output, session) {
  chapter3_server(input, output, session)
  output$introTab <- renderUI({
    includeMarkdown("chapters/Introduction.Rmd")  
  })
  output$contextTab <- renderUI({
    includeMarkdown("chapters/Context.Rmd")
  })
  output$proposedsolutionTab <- renderUI({
    includeMarkdown("chapters/Proposed-solution.Rmd")
  })
  output$MethodsTab <- renderUI({
    includeMarkdown("chapters/Methods.Rmd")
  })
  output$querygenerationTab <- renderUI({
    
    rmarkdown::render("chapters/Querygeneration.Rmd")
    includeHTML("chapters/Querygeneration.html")
    
  })
  output$semanticsearchTab <- renderUI({
    includeMarkdown("chapters/Semanticsearch.Rmd")
  })
  output$topicmodelingTab <- renderUI({
    includeMarkdown("chapters/topicmodeling.Rmd")
  })
  output$networkanalysisTab <- renderUI({
    includeMarkdown("chapters/networkanalysis.Rmd")
  })
  output$ResultsTab <- renderUI({
    includeMarkdown("chapters/Results.Rmd")
  })
  output$modeloutputTab <- renderUI({
    includeMarkdown("chapters/modeloutput.Rmd")
  })
  output$modelperformanceTab <- renderUI({
    includeMarkdown("chapters/modelperformance.Rmd")
  })
  output$implementationoptionsTab <- renderUI({
    includeMarkdown("chapters/implementationoptions.Rmd")
  })
  output$casestudyTab <- renderUI({
    #includeMarkdown("chapters/casestudy.Rmd")
    rmarkdown::render("chapters/casestudy.Rmd")
    includeHTML("chapters/casestudy.html")
  })
  output$contributorsTab <- renderUI({
    includeMarkdown("chapters/contributors.Rmd")
  })
}

# Run the Shiny app
shinyApp(ui, server)
