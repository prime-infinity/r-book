# chapters/chapter5.R

chapter5_ui <- box(
  
  title = "Chapter 4 Methods",
  
  p(
    "This paper describes a methodology for systematically monitoring the use of UNHCR microdata. We develop a workflow for searching literature repositories with an initial focus on academic research, but with plans to include 'grey literature' in the future. We take a three-step approach to producing a comprehensive and informative list of the papers that reference a particular dataset."
  ),
  p(
    "For a given dataset, we begin by combining information from the metadata fields available for the study and using these terms to form multiple and overlapping search queries; these include the primary authoring organization, the year of the survey, and the country in which the study was carried out."
  ),
  p("Second, we use the generated query strings to generate sets of search results for each UNHCR microdata set from Semantic Scholar."
  ),
  p(
    "Third,Once a list of possible references has been compiled for each dataset, we compute for each reference a measure of its relevance to the dataset in question using Natural Language Processing (NLP). We first generate a list of topics contained in each reference using the topic modeling and analysis tools made available by",
    a(href = "https://www.nlp4dev.org/", "NLP4Dev"),
    ". To classify each possible reference by relevance to a given dataset, we consider 1) the share of identified topics related to forced displacement, 2) the set of countries mentioned in the reference, and 3) the frequency of a curated set of key-word tags related to forced displacement."
  ),
  
  p("Below we summarize the three primary methods that were used throughout this process. Each is described in greater detail in a link on the left side of the page.
  "),
  
  HTML(
    '<table class="table">
    <thead>
      <tr>
        <th></th>
        <th>Step</th>
        <th>Input</th>
        <th>Output</th>
        <th>Benefit</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td><a href="methods/query-generation.md">Query generation</a></td>
        <td>Metadata for an individual dataset</td>
        <td>List of query strings</td>
        <td>Information about topics and countries included, field of study, and nature of use</td>
      </tr>
      <tr>
        <td>2</td>
        <td><a href="methods/semantic-search.md">Semantic search</a></td>
        <td>One or more query strings for each dataset</td>
        <td>List(s) of citing papers</td>
        <td>Information about topics and countries included, field of study, and nature of use</td>
      </tr>
      <tr>
        <td>3</td>
        <td><a href="methods/topic-modeling-and-sentiment-analysis.md">Topic modeling/ sentiment analysis</a></td>
        <td>Text of individual citing papers</td>
        <td>Information about topics and countries included, field of study, and nature of use</td>
        <td>We can determine how the dataset is used in each matching publication without resorting to manual review/analysis</td>
      </tr>
    </tbody>
  </table>'
  ),
  
  
  h3("Tools"),
  p(
    "We use two external tools: APIs powered by Semantic Scholar and NLP4Dev. We load corpuses from both and store them in",
    a(href = "https://console.cloud.google.com/storage/browser/mdl-explorer-app;tab=objects?project=unhcr-microdata&prefix=&forceOnObjectsSortingFiltering=false", "Google Cloud Storage"),
    "."
  ),
  
  h3("Citations"),
  p("The following papers informed our approach:"),
  
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
  
  h3("Network Analysis"),
  p(
    "The final portion of our methodology allows us to obtain higher-level insights about the network of authors/papers making use of UNHCR microdata.",
    "have worked on identifying \"meaningful\" citations Researchers such as",
    a(href = "#", "{cite}`Cohan2019`"),
    "and",
    a(href = "#", "{cite}`teufel-etal-2006-annotation`"),
    "have developed methods for inferring \"citation intent\", or information about _how_ a paper references another paper (or in our case, a dataset).",
    a(href = "#", "{cite}`Jurgens2018`"),
    "extend this to use citations as a lens through which to understand the evolution of a given scientific field."
  ),
  
  
  width=12
)

