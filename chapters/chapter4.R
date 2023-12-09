# chapters/chapter4.R

chapter4_ui <- box(
  
  title = "Chapter 3 Proposed Solution",
  p("Our proposed solution is an automated process which generates outputs at two levels."),
  # Dataset-level outputs
  h2("Dataset-level outputs"),
  tags$ul(
    tags$li("List of citing papers"),
    tags$li("Distribution of fields of study"),
    tags$li("Distribution of nature of use")
  ),
  
  # Library-level outputs
  h2("Library-level outputs"),
  tags$ul(
    tags$li("Network of citing authors"),
    tags$li("Network of citing disciplines"),
    tags$li(
      div(
        class = "note",
        "Citing disciplines depend on categories defined by external institutions."
      )
    )
  ),
  
  # Stakeholder benefits
  h3("We hope that this approach will provide value to multiple stakeholders, such as:"),
  HTML(
    '<table class="table">
      <thead>
        <tr>
          <th>Audience</th>
          <th>Benefit</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>UNHCR/ GDS Microdata Curation Team</td>
          <td>Automated procedure saves time and identifies citations that would otherwise be missed, and usage statistics will give the team objective information on which datasets are useful</td>
        </tr>
        <tr>
          <td>UNHCR Operations</td>
          <td>Usage statistics and network analysis may illuminate usage gaps (e.g. additional fields that would be helpful to include in surveys)</td>
        </tr>
        <tr>
          <td>Prospective MDL users</td>
          <td>Tool can provide insight into how our data has been used in the past (and thus what is possible for their own work)</td>
        </tr>
      </tbody>
    </table>'
  ),
  
  width = 12
)

