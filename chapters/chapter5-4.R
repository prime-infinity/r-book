# chapters/chapter5.R

chapter5_4_ui <- box(
  
  h3("Semantic Search"),
  p(
    "We made use of the",
    a(href = "https://www.semanticscholar.org/product/api", "Semantic Scholar API"),
    ". For each of the query strings generated in the last section, we pass them to the ",
    a(href = "https://api.semanticscholar.org/api-docs/graph#tag/Paper-Data", "\"Paper Lookup\" API endpoint"),
    ", which we access through the",
    a(href = "https://github.com/danielnsilva/semanticscholar", "SemanticScholar Python library"),
    "using the following call:"
  ),
  
  h3("Citations"),
  p("The following papers informed our approach:"),
  
 
  width=12
)

