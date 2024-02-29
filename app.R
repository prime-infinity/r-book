library(dplyr)
library(ggplot2)
library(rmarkdown)
library(markdown)
library(shiny)
library(knitr)
library(shinydashboard)
library(RefManageR)
library(reticulate)
library(kableExtra)
py_install("pandas")
library(here)
here::i_am("app.R")


# Load chapter files
source(here::here("chapters/helper_functions.R"))
source(here::here("chapters/Bibliography.R"))
source(here::here("chapters/chapter3.R"))
source(here::here("chapters/casestudy_app.R"))
source(here::here("chapters/helper_functions.R"))
source(here::here("chapters/process_query_formulation.R"))
source(here::here("chapters/data_prep.R"))

# Define the UI for the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "MDL Citation Explorer"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "Introduction"),
      menuItem("1.Context", tabName = "Context"),
      
      menuItem("2.Proposed Solution", tabName = "Proposed-Solution"),
      
      menuItem("3.Methods", tabName = "Methods"),
      
      menuItem("Methods/", tabName = "Methods2",
               menuSubItem("3.1 Query Generation", tabName = "query-generation"),
               menuSubItem("3.2 Semantic Search", tabName = "semantic-search"),
               menuSubItem("3.3 Topic Modeling", tabName = "topic-modeling"),
               menuSubItem("3.4 Network Analysis", tabName = "network-analysis")
      ),
      menuItem("4.Results", tabName = "Results"),
      
      menuItem("Results/", tabName = "Results2",
               menuSubItem("4.1. Model Output", tabName = "model-output"),
               menuSubItem("4.2. Evaluating Model Performance", tabName = "model-performance")
      ),
      
      #menuItem("5.Implementation Options", tabName = "implementation-options"),
      
      menuItem("5.Case Study", tabName = "case-study"),
      
      menuItem("6.Contact", tabName = "contributors"),
      
      menuItem("7.Codebase", tabName = "codebase"),
      
      menuItem("8.Bibliography", tabName = "bibliography")
      
      #menuItem("Chapter 3", tabName = "chapter3")
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
    
     
      #tabItem(tabName = "implementation-options", uiOutput("implementationoptionsTab")),
      
      
      tabItem(tabName = "case-study", case_study_ui),
      
      tabItem(tabName = "codebase", uiOutput("codebaseTab")),
      
      tabItem(tabName = "contributors", uiOutput("contributorsTab")),
      
      tabItem(tabName = "bibliography", bibliography_ui)
     
      #tabItem(tabName = "chapter3", chapter3_ui)
      
      
    )
  )
)

# Define the server logic for the Shiny app
server <- function(input, output, session) {
  #chapter3_server(input, output, session)
  case_study_server(input, output, session)
  output$introTab <- renderUI({
    includeMarkdown("chapters/Introduction.Rmd")  
  })
  output$contextTab <- renderUI({
    #includeMarkdown("chapters/Context.Rmd")
    rmarkdown::render("chapters/Context.Rmd")
    includeHTML("chapters/Context.html")
  })
  output$proposedsolutionTab <- renderUI({
    #includeMarkdown("chapters/Proposed-solution.Rmd")
    rmarkdown::render("chapters/Proposed-solution.Rmd")
    includeHTML("chapters/Proposed-solution.html")
  })
  output$MethodsTab <- renderUI({
    #includeMarkdown("chapters/Methods.Rmd")
    rmarkdown::render("chapters/Methods.Rmd")
    includeHTML("chapters/Methods.html")
  })
  output$querygenerationTab <- renderUI({
    
    rmarkdown::render("chapters/Querygeneration.Rmd")
    includeHTML("chapters/Querygeneration.html")
    
  })
  output$semanticsearchTab <- renderUI({
    #includeMarkdown("chapters/Semanticsearch.Rmd")
    rmarkdown::render("chapters/Semanticsearch.Rmd")
    includeHTML("chapters/Semanticsearch.html")
  })
  output$topicmodelingTab <- renderUI({
    #includeMarkdown("chapters/topicmodeling.Rmd")
    rmarkdown::render("chapters/topicmodeling.Rmd")
    includeHTML("chapters/topicmodeling.html")
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
    #includeMarkdown("chapters/modelperformance.Rmd")
    rmarkdown::render("chapters/modelperformance.Rmd")
    includeHTML("chapters/modelperformance.html")
  })
  output$implementationoptionsTab <- renderUI({
    includeMarkdown("chapters/implementationoptions.Rmd")
  })
  # output$casestudyTab <- renderUI({
  #   #includeMarkdown("chapters/casestudy.Rmd")
  #   #rmarkdown::render("chapters/casestudy.Rmd")
  #   #includeHTML("chapters/casestudy.html")
  #   HTML(markdown::markdownToHTML(knit('chapters/casestudy.Rmd', quiet = TRUE)))
  # })
  output$codebaseTab <- renderUI({
    #includeMarkdown("chapters/contributors.Rmd")
    rmarkdown::render("chapters/codebase.Rmd")
    includeHTML("chapters/codebase.html")
  })
  output$contributorsTab <- renderUI({
    #includeMarkdown("chapters/contributors.Rmd")
    rmarkdown::render("chapters/contributors.Rmd")
    includeHTML("chapters/contributors.html")
  })
}

# Run the Shiny app
shinyApp(ui, server)
