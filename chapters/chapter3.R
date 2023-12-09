# chapters/chapter3.R

#input_data <- read.csv("dataset189_query1.csv")
#input_data <- read.csv(file.path(getwd(), "chapters", "dataset189_query1.csv"))
input_data <- read.csv(file.path(getwd(), "chapters", "concatenated_results_12_May.csv"))
dataset_numbers <- unique(input_data$dataset_id)
query_numbers <- unique(input_data$query_type)

# chapters/chapter3.R

chapter3_ui <- box(
  titlePanel("Chapter 3 Content"),
   
        # Action button and selectInput from the original code
        # actionButton("newplot", "New plot"),
        selectInput(
          inputId = "selected_dataset",
          label = "Select dataset number",
          choices = dataset_numbers,
          selected = 189,
          multiple = FALSE,
          selectize = TRUE,
          width = NULL,
          size = NULL
        ),
        
        selectInput(
          inputId = "selected_query",
          label = "Select query type",
          choices = query_numbers,
          selected = "AFRO",
          multiple = FALSE,
          selectize = TRUE,
          width = NULL,
          size = NULL
        ),
    
           
    
     fluidRow(
       # Table output from the original code
       tableOutput("table1")
     ),
     fluidRow(
       # Additional Markdown content
       tags$div(
         HTML("## Additional Content"),
         HTML("This is some additional Markdown content."),
         HTML("You can include more text, lists, images, etc.")
       )
     ),
    width = 12
)


chapter3_server <- function(input, output, session) {
  output$table1 <- renderTable({
    # input$newplot
    # Add a little noise to the cars data
    input_data %>%
      filter(dataset_id == input$selected_dataset,
             query_type == input$selected_query)
  })
}

