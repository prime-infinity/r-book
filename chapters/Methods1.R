chapter5_1_ui <- box(
  
  title = "3. Methods",
  
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
  
  
  h3("3.1.Tools"),
  p(
    "We use two external tools: APIs powered by Semantic Scholar and NLP4Dev. We load corpuses from both and store them in",
    a(href = "https://console.cloud.google.com/storage/browser/mdl-explorer-app;tab=objects?project=unhcr-microdata&prefix=&forceOnObjectsSortingFiltering=false", "Google Cloud Storage"),
    "."
  ),
  
  width=12
)

