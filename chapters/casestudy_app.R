library(dplyr)
library(shiny)
library(tidyr)
library(markdown)
library(htmltools)
library(markdown)
library(reticulate)
library(janitor)
library(kableExtra)
library(purrr)
library(stringr)
source(here::here("chapters/data_prep.R"))



# UI for Shiny app
case_study_ui <- fluidPage(
  titlePanel("Case Study"),
  selectInput(
    inputId = "selected_dataset",
    label = "Select dataset number",
    choices = unique(dfq$id),
    selected = 189,
    multiple = FALSE,
    selectize = TRUE,
    width = NULL,
    size = NULL
  ),
  includeMarkdown(here::here("chapters/case_study_md/query_generation.md")),
  tableOutput("query_formulations"),
  includeMarkdown(here::here("chapters/case_study_md/query_counts_table.md")),
  tableOutput("query_count_table"),
  hr(),
  includeMarkdown(here::here("chapters/case_study_md/semantic_search.md")),
  selectInput(
    inputId = "selected_query",
    label = "Select query type",
    choices = c(1:6),
    selected = 1,
    multiple = FALSE,
    selectize = TRUE,
    width = NULL,
    size = NULL
  ), 
  textOutput("raw_query_text"),
  htmlOutput("raw_query_results"),
  
  includeMarkdown(here::here("chapters/case_study_md/topic_modeling.md")),
  selectInput(
    inputId = "selected_paper_id",
    label = "Select paper ID",
    choices = unique(topics_countries_tags$paper_id),
    selected = 2874456,
    multiple = FALSE,
    selectize = TRUE,
    width = NULL,
    size = NULL
  ),
  tableOutput("NLP4DEV_output"),
  #includeMarkdown(here::here("chapters/case_study_md/relevance_summary.md")),
  includeMarkdown(here::here("chapters/case_study_md/model_output.md")),
  sliderInput(inputId = "relevance_threshold", label = "Select relevance threshold:",
              min = 0, max = 1, step = 0.1, value = .10
  ),
  #textOutput("test"),
  tableOutput("relevance_table"),
  #includeMarkdown(here::here("chapters/case_study_md/evaluating_model_performance.md")),
  includeMarkdown(here::here("chapters/case_study_md/network_analysis.md")),
  plotOutput("network_chart")
  #includeMarkdown(here::here("chapters/contributors.md"))
  #includeHTML(markdown::markdownToHTML(knit(here::here("chapters/contributors.Rmd"), quiet = TRUE)))
)


case_study_server <- function(input, output, session) {
  query_compilations <- reactive({
    dfq %>% 
      dplyr::select(id, query_type1, query_type2,query_type3,query_type4,query_type5,query_type6) %>% 
      dplyr::filter(id == input$selected_dataset) %>% 
      tidyr::pivot_longer(cols = c(query_type1, query_type2,query_type3,query_type4,query_type5,query_type6)
                   ,names_to = "query_type",
                   names_prefix = "query_type") %>% 
      dplyr::rename(query_text = value) %>% 
      dplyr::mutate(query_type = as.integer(query_type))
  })
  output$query_formulations <- renderTable(query_compilations())
  
  #file_path <- reactive({here::here(paste0("data/query_results/dataset", input$selected_dataset, "_query", input$selected_query, ".csv"))})
  
  all_queries <- reactive({  
    all_query_counts %>% 
      dplyr::filter(dataset_id == input$selected_dataset)
    # # Create a data frame for displaying results
    #  start_queries <- data.frame()
    #  
    # # Build file path based on user input
    # for (i in 1:6){
    #   
    #   #ERROR HANDLING
    #   possibleError <- tryCatch(
    #   #   Build file path based on user input
    #     temp_file <- read.csv(file_path()),
    #     error=function(e) e
    #   )
    # 
    #   if(inherits(possibleError, "error")) next
    # 
    #   #REAL WORK
    #   start_queries <- start_queries %>% rbind(temp_file)
    # }
    # 
    #   start_queries
  })    
  
  # Count the number of rows in the results
  # summary <- all_queries %>%
  #   group_by(query_type) %>%
  #   summarize (n_results = n())
  
  # toListen <- reactive({
  #   list(input$selected_dataset,input$selected_query)
  # })
  
  # observeEvent(input$selected_dataset, 
  #              {
  output$query_count_table <- renderTable(all_queries() %>%
                                            dplyr::group_by(query_type) %>%
                                            dplyr::summarize (n_results = n())
  ) 
  #renderText(dim(all_queries()))
  
  # })
  
  
  
  single_query_output <- reactive({
    
    paste0("Query text: ",
           
           (dfq %>% 
              dplyr::select(id, query_type1, query_type2,query_type3,query_type4,query_type5,query_type6) %>% 
              dplyr::filter(id == input$selected_dataset) %>% 
              tidyr::pivot_longer(cols = c(query_type1, query_type2,query_type3,query_type4,query_type5,query_type6)
                           , names_to = "query_type"
                           , names_prefix = "query_type") %>% 
              dplyr::rename(query_text = value) %>% 
              dplyr::mutate(query_type = as.integer(query_type)) %>%
              dplyr::filter(query_type == input$selected_query))[[3]][1]
    )
    
  })
  
  output$raw_query_text <- renderText(single_query_output())
  
  
  # Load raw results for the selected dataset and query
  results <- reactive({
    
    data.frame(query_type = c(1:6)) %>%
      dplyr::filter(query_type == input$selected_query)
    
  })
  
  # Show actual query results
  #file_path <- reactive({here::here(paste0("data/query_results/dataset", input$selected_dataset, "_query", input$selected_query, ".csv"))})
  
  output$raw_query_results <- #renderTable(all_queries())
    renderText({
      kable(all_queries() %>% dplyr::select(-X) %>% 
              filter(dataset_id == input$selected_dataset,
                     query_type == input$selected_query))%>%
        kable_styling("striped", 
                      full_width = F) %>%
        kableExtra::scroll_box(width = "100%", height = "400px")
      
    })
  # Topic modeling
  selected_NLP4Dev_output <- reactive({
    topics_countries_tags %>%
      dplyr::filter(paper_id == input$selected_paper_id)
  })
  
  output$NLP4DEV_output <- renderTable(selected_NLP4Dev_output())
  
  
  selected_paper <- reactive ({
    topics_countries_tags %>%
      dplyr::filter(paper_id == input$selected_paper_id)
  })
  
  FT_status <- reactive ({
    topics_countries_tags$full_text_status[topics_countries_tags$paper_id == input$selected_paper_id]
  })
    

 #output$test <- renderText(FT_status())
  
  # Call the R function to calculate relevance using the Python function
  relevance_result <- reactive({
    
    if(FT_status() == "Output for Full Text"){
      calculate_relevance_for_pair(
        paper_id = input$selected_paper_id,
        dataset_number = input$selected_dataset,
        abstract_or_full_text = "full_text",
        topic_39_percentage_abstract = selected_paper()$abstract_topic39[1],
        topic_39_percentage_full_text = selected_paper()$full_text_topic39[1],
        jdc_tag_count_abstract = selected_paper()$abstract_tag_count[1], 
        jdc_tag_count_full_text = selected_paper()$full_text_tag_count[1],
        majority_country_abstract= selected_paper()$abstract_majority_country[1], 
        majority_country_full_text = selected_paper()$body_majority_country[1],
        relevance_threshold = input$relevance_threshold)
    } else {
      calculate_relevance_for_pair(
        paper_id = input$selected_paper_id,
        dataset_number = input$selected_dataset,
        abstract_or_full_text = "abstract",
        topic_39_percentage_abstract = selected_paper()$abstract_topic39[1],
        topic_39_percentage_full_text = selected_paper()$full_text_topic39[1],
        jdc_tag_count_abstract = selected_paper()$abstract_tag_count[1], 
        jdc_tag_count_full_text = selected_paper()$full_text_tag_count[1],
        majority_country_abstract= selected_paper()$abstract_majority_country[1], 
        majority_country_full_text = selected_paper()$body_majority_country[1],
        relevance_threshold = input$relevance_threshold)
    }
  
  })
  
  output$relevance_table <- renderTable({relevance_result()})

  
  output$network_chart <- renderPlot({
    country_mention_heat_map(input$selected_dataset,input$selected_query)
  })
  
  
}

# params <- reactiveValues(selected_dataset,
#                          selected_query_type,
#                          selected_paper_id,
#                          query_formulations,
#                          query_count_table,
#                          raw_query_results)
# 
# # assign in one reactive environment
# observe({
#   params[["selected_dataset"]] <-  input$selected_dataset
#   params[["selected_query_type"]] <-  input$selected_query_type
#   params[["selected_paper_id"]] <-  input$selected_paper_id
#   params[["query_formulations"]] <-  output$query_formulations
#   params[["selected_query_text"]] <-  output$query_formulations %>% filter(query_type == input$selected_query_type)
#   params[["query_count_table"]] <-  output$query_count_table
#   params[["raw_query_results"]] <-  output$raw_query_results
# })

shinyApp(case_study_ui, case_study_server)
