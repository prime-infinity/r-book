# chapters/chapter4.R

chapter4_1_ui <- box(
  title = "Chapter 3 Proposed Solution",
  p("Our proposed solution is an automated process which generates outputs at two levels."),
  
  # Dataset-level outputs
 
   h2("Dataset-level outputs"),
   tags$ul(
     tags$li("List of citing papers"),
     tags$li("Distribution of fields of study"),
     tags$li("Distribution of nature of use"),
   ),
   
  width = 12
)
