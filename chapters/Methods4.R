# Specify the path to your reference.bib file
bib_path <- "chapters/references.bib"

# Read the BibTeX file into a bibliography object
bib <- ReadBib(bib_path)
chapter5_4_ui <- box(
  
  h3("3.4 Semantic Search"),
  p(
    "We made use of the",
    a(href = "https://www.semanticscholar.org/product/api", "Semantic Scholar API"),
    ". For each of the query strings generated in the last section, we pass them to the ",
    a(href = "https://api.semanticscholar.org/api-docs/graph#tag/Paper-Data", "\"Paper Lookup\" API endpoint"),
    ", which we access through the",
    a(href = "https://github.com/danielnsilva/semanticscholar", "SemanticScholar Python library"),
    "using the following call:"
  ),
  
  p("The output is an object which includes (among others) the following information"),
  
  HTML('
      <ul>
        <li>Dataset ID</li>
        <li>Paper IDs (includes SS’s internal ID, as well as external IDs such as DOI, arXiv, Pubmed, etc. where available)</li>
        <li>Title</li>
        <li>Authors</li>
        <li>Publication venue</li>
        <li>Publication year</li>
        <li>Field of Study</li>
        <li>Count of inbound and outbound citations</li>
        <li>URL</li>
        <li>Abstract</li>
        <li>PDF availability (indicates whether the full PDF is included in the corpus, and whether the abstract, body, and bibliographic entries are available in parsedt format)</li>
       </ul>'
  ),
  
  p("We extract abstracts from this output, giving us an abstract for each dataset-query-paper combination where an abstract is available. The abstract, together with the indicator of PDF availability, serves as an input into our topic modeling procedure (see the next section.)"),
  
  p("Where available, we also parse PDF content. When we parse a PDF, the output is an object which includes (among others) the following information:"),
  
  HTML('
      <ul>
        <li>Paper ID</li>
        <li>PDF hash</li>
        <li>Abstract (if available)</li>
        <li>Body text (if available)</li>
        <li>Bibliographic entries</li>
       </ul>'
  ),
  
  h3("3.4.1 Citations"),
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

