
chapter6_1_ui <- box(
  
  title = "4 Results",
  
  p("In this section we describe the output of the pipeline that was developed in the Methods section. This section has two components:
  "),
  
  h3("4.1. Model Output"),
  
  p("We refer to each combination of query selection, results retrieval, and relevance scoring method, as a 'model'. The output of each model is therefore the list of results returned.
  "),

  h3("4.2. Evaluating Model performance"),
  
  p("Because each model has unique inputs and outputs, we can evaluate each model on some relevant performance metric. Our main aim is to evaluate how effective each model is at returning the highest number of “potentially relevant results that are subsequently confirmed to be truly relevant."),
  
  h3("4.3. Model Output"),
  
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

