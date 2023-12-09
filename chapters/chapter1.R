# chapters/chapter1.R

chapter1_ui <- fluidRow(
  column(12,
  box(
    title = "Chapter 1 Content",
    # You can mix markdown and Shiny code chunks here.
    h1("This is the content of Chapter 1"),
    
    # Introduction 
    h6("Many humanitarian and development data."),
    p("a paragraph"),
    plotOutput("plotChapter1")
    )
  )
)

chapter1_server <- function(input, output,session) {
  output$plotChapter1 <- renderPlot({
    plot(1:10, main = "Chapter 1 Plot")
  })
}
