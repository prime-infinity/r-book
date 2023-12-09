# chapters/chapter2.R

chapter2_ui <- fluidRow(
  column(12,
         box(
           title = "Chapter 2 Content",
           "This is the content of Chapter 2. You can mix markdown and Shiny code chunks here.",
           sliderInput("slider", "Choose a number:", 1, 10, 5),
           textOutput("text_output"),
           plotOutput("plotChapter2")
         )
  ),
  column(12,
         # Additional HTML content
         tags$div(
           HTML("## Additional Content"),
           HTML("This is some additional HTML content."),
           HTML("You can include more text, lists, images, etc.")
         )
  )
)

chapter2_server <- function(input, output, session) {
  output$plotChapter2 <- renderPlot({
    plot(10:1, main = "Chapter 2 Plot")
  })
  
  # Reactive expression to compute a square of the selected number
  square_result <- reactive({
    input$slider^2
  })
  
  # Output the result to the UI
  output$text_output <- renderText({
    paste("The square of", input$slider, "is", square_result())
  })
}
