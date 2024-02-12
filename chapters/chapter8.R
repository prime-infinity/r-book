
chapter8_ui <- box(
  
  title = "6. Case Study: VaSyR 2018",
  
  h3("6.1. Query generation"),
  p("LIST THE TEXT OF THE ACTUAL 6 QUERIES"),
  
  h3("6.2. Semantic Search"),
  
  p("Each of the six queries returned X potentially relevant papers. [GENERATE A DATA FRAME CONTAINING THE NUMBER OF RESULTS PER QUERY AND DISPLAY HERE"),
  
  h3("6.3. Topic Modeling"),
  
  p("Out of the XX papers returned across the six query types, YYY had abstracts available in either the NLP4Dev or Semantic Scholar corpuses, and ZZZ had full body text available."),
  
  p("These were used as inputs to the NLP4Dev API, as described in Section 3.5."),
  
  p("XXX were defined as relevant."),
  
  h3("6.4. Model Output"),
  p("Following manual review of the papers identified automatically, XXX were confirmed as relevant. Of these XXX, YYY had previously been identified through the manual procedure, and ZZZ were new."),
  p("This represents a XXX percent improvement over the baseline."),
  
  h3("6.5. Evaluating Model Performance"),
  p("Based on our selected evaluation metric, Query X performed most effectively"),
  
  h3("6.6. Network analysis"),
  p("Of the papers that referenced this dataset, XYZ came from ABC geographies and ABC instutions."),
  
  width = 12
  
)
