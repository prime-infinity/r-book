# chapters/chapter5.R

chapter5_3_ui <- box(
  
  
  h3("Query Generation"),
  p(
    "We begin by generating a set of search queries based on the metadata for each dataset.",
    "The full query creation notebook can be found",
    a(
      href = "https://github.com/ofatunde/mdl-explorer-app/blob/main/notebooks/Semantic_Scholar_NLP4DEV.ipynb",
      "here"
    ),
    "."
  ),
  
  p(
    "We start with simple methods of combining the metadata. The key metadata components that we use as an input into queries are:",
    "* Core survey name",
    "* Survey abbreviation (e.g., VaSyR)",
    "* Lead organization (e.g., UNHCR) - short or long versions may be used",
    "* Category (e.g., Socioeconomic Asessment of Refugees)",
    "* Country",
    "* Year"
  ),
  
  p("For our initial exploration, we define six simple query types which represent different combinations of the information above :"),
  
  HTML(
    '<ul>
    <li><strong>Query type 1:</strong> lead_org_short + year + name + shortcode</li>
    <li><strong>Query type 2:</strong> lead_org_short + year + name + full_name</li>
    <li><strong>Query type 3:</strong> lead_org_short + year + name + shortcode_fullname</li>
    <li><strong>Query type 4:</strong> lead_org_long + year + name + shortcode</li>
    <li><strong>Query type 6:</strong> lead_org_long + year + name + shortcode_fullname</li>
  </ul>'
  ),
  
  p("Defining query structure is an important step, as the search output can be sensitive to the contents of the query used for the search. For example, the six queries above return different number of results if entered into Semantic Scholar. 
  "),
  
  h3("Next steps"),
  
  p("After generating these queries, we treat them as inputs to the Semantic Scholar API. See [the next section](methods/semantic-search.md) for more details.
  "),
  
  h3("Citations"),
  p("The following papers informed our approach:"),
  
 
  width=12
)

