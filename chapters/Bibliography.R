# Specify the path to your reference.bib file
bib_path <- "chapters/references.bib"

# Read the BibTeX file into a bibliography object
bib <- ReadBib(bib_path)
chapter10_ui <- box(
  
  title = "8. Bibliography",
  
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
 
  width = 12
  
)
