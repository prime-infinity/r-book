
chapter4_2_ui <- box(

  # Library-level outputs
  h2("Library-level outputs"),
  tags$ul(
    tags$li("Network of citing authors"),
    tags$li("Network of citing disciplines"),
  ),

  # Additional note
  div(
    class = "note",
    "Citing disciplines depend on categories defined by external institutions."
  ),

  # Stakeholder benefits
  h5("We hope that this approach will provide value to multiple stakeholders, such as:"),
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
  
  # Custom styles for the note
  tags$style(HTML("
    .note {
      background-color: #f0f8ff; /* Light blue background */
      border-left: 5px solid #007BFF; /* Blue left border */
      padding: 10px; /* Padding for content */
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Shadow */
    }
  ")),
  
  
  width = 12
)
