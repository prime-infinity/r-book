case_study_server <- function(input, output) {
  query_results <- reactive({
    # Build file path based on user input
    file_path <- paste0("dataset", input$selected_dataset, "_query", input$selected_query, ".csv")
    
    # Load results for the selected dataset and query
    results <- read.csv(file_path)
    
    # Count the number of rows in the results
    query_count <- nrow(results)
    
    # Create a data frame for displaying results
    query_count_table <- data.frame(query_type = input$selected_query, query_count = query_count)
    
    
  })
  
  # Render the table based on reactive function
  output$query_results <- renderTable({
    query_results()
  }, sanitize.text.function = function(x) x)
}

# # UI for Shiny app
# ui <- fluidPage(
#   selectInput(
#     inputId = "selected_dataset",
#     label = "Select dataset number",
#     choices = c(189, 154, 160),
#     selected = 189,
#     multiple = FALSE,
#     selectize = TRUE,
#     width = NULL,
#     size = NULL
#   ),
#   selectInput(
#     inputId = "selected_query",
#     label = "Select query type",
#     choices = c(1, 2, 3, 4, 5),
#     selected = 1,
#     multiple = FALSE,
#     selectize = TRUE,
#     width = NULL,
#     size = NULL
#   ),
#   tableOutput("query_results")
# )


query_count_table <- data.frame(test1 = c(1:10), test2 = c(11:20))
