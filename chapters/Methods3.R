# Specify the path to your reference.bib file
bib_path <- "chapters/references.bib"

# Read the BibTeX file into a bibliography object
bib <- ReadBib(bib_path)

chapter5_3_ui <- box(
  
  
  h3("3.3. Query Generation"),
  p(
    "We begin by generating a set of search queries based on the metadata for each dataset.",
    "The full query creation notebook can be found",
    a(
      href = "https://github.com/ofatunde/mdl-explorer-app/blob/main/notebooks/Semantic_Scholar_NLP4DEV.ipynb",
      "here"
    ),
    "."
  ),
  
  p("We start with simple methods of combining the metadata. The key metadata components that we use as an input into queries are:"),
  HTML('
      <ul>
        <li>Core survey name</li>
        <li>Survey abbreviation (e.g., VaSyR)</li>
        <li>Lead organization (e.g., UNHCR) - short or long versions may be used</li>
        <li>Category (e.g., Socioeconomic Asessment of Refugees)</li>
        <li>Country</li>
        <li>Year</li>
       </ul>'
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
  
  p("The table below shows the number of results returned by Semantic Scholar for each dataset"),
  
  h3("3.3.1 Next steps"),
  
  p("After generating these queries, we treat them as inputs to the Semantic Scholar API. See [the next section](methods/semantic-search.md) for more details.
  "),
  
  h3("3.3.2 Citations"),
  p("The following papers informed our approach:"),
  
  # Render citations using RefManageR
  tags$ul(
    lapply(c("Bakke2016","Chen2006","Cohan2019","Cutting1992","Fast2016","Jurgens2018","teufel-etal-2006-annotation","ValenzuelaEscarcega2015IdentifyingMC"
    ), function(cite_key) {
      
      # Extract information from the bibliography entry
      citation_info <- bib[[cite_key]]
      
      # Format the authors
      authors <- sapply(citation_info$author, function(author) {
        paste(author$given, author$family, collapse = " ")
      })
      
      # Format the information for display
      formatted_info <- paste(
        "Title:", citation_info$title, "<br>",
        "Authors:", paste(authors, collapse = ", "), "<br>",
        "Book Title:", citation_info$booktitle, "<br>",
        "Year:", citation_info$year, "<br>",
        if (!is.null(citation_info$url)) paste("URL:", citation_info$url, "<br>", sep = ""),
        "<hr>"
      )
      
      # Display the formatted information
      tags$li(HTML(formatted_info))
    })
  ),
 
  width=12
)

