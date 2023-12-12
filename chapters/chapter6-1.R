# chapters/chapter6.R

chapter6_1_ui <- box(
  
  title = "Chapter 5 Results",
  
  p("In this section we describe the output of the pipeline that was developed in the Methods section. This section has two components:
  "),
  
  h3("Model Output"),
  
  p("We refer to each combination of query selection, results retrieval, and relevance scoring method, as a 'model'. The output of each model is therefore the list of results returned.
  "),

  p(
    "Each model returns a list of papers with the following information:"
  ),
  
  HTML(
    '<ul>
    <li>Dataset Title</li>
    <li>Paper Title</li>
    <li>Binary relevance</li>
    <li>Continunous relevance score</li>
    <li>Number of JDC tags mentioned</li>
    <li>Percentage of paper dedicated to forced displacement</li>
  </ul>'
  ),
  
  width = 12
)

