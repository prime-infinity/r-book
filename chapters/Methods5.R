# Specify the path to your reference.bib file
bib_path <- "chapters/references.bib"

# Read the BibTeX file into a bibliography object
bib <- ReadBib(bib_path)

chapter5_5_ui <- box(
  
  h3("3.5 opic Modeling and Sentiment Analysis"),
  p("We imported the documents available in the Semantic Scholar and NPL4Dev corpuses."),
  p("We make use of the [NLP4Dev API] (https://www.nlp4dev.org/content-api). Depending on whether the paper contents are available in parsed or PDF formay, we use either the “Analyze Text” or the “Analyze File” endpoint. In both cases we make use of the Mallet topic model, which allows us to use the abstract or full text of a paper as an input and retrieve information about the paper content as an output."),
  p("We run the abstracts or PDF text from the Semantic Scholar results through the NLP4DEV API, which returns the following information:"),
  
  HTML('
      <ul>
        <li>country counts</li>
        <li>country group</li>
        <li>JDC tags (a list of phrases defined by NLP4Dev as being related to forced displacement)</li>
        <li>the tag counts</li>
        <li>dataset ID</li>
        <li>Corpus ID</li>
        <li>the country that is mentioned the most.</li>
       </ul>'
  ),
  
  p("The JDC tags include the following:"),
  
  HTML('
      <ul>
        <li>“asylum seeker”</li>
        <li>“climate refugee”</li>
        <li>“country of asylum”</li>
        <li>“exile”</li>
        <li>”forced displacement”</li>
        <li>“host community”</li>
        <li>“internally displaced population”</li>
        <li>“ocha”, “population of concern”</li>
        <li>“refugee”</li>
        <li>“refugee camp”</li>
        <li>“repatriate”</li>
        <li>“resetlement area”</li>
        <li>“returnee”</li>
        <li>“stateless”</li>
        <li>“unhcr”</li>
       </ul>'
  ),
  
  h3("3.5.1 Citations"),
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

