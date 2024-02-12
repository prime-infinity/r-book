
chapter9_ui <- box(
  
  title = "7. Contributors",
  p("Contributors to this project, as well as their contact information, are listed below."),
  
  #table
  HTML(
    '<table class="table">
      <thead>
        <tr>
          <th>Name</th>
          <th>Institution</th>
          <th>Email</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Olumurejiwa Fatunde</td>
          <td>University of Toronto/JDC</td>
          <td>atoke91@gmail.com</td>
        </tr>
        <tr>
          <td>Patrick Brock</td>
          <td>UNHCR/JCR</td>
          <td>brock@unhcr.org</td>
        </tr>
        <tr>
          <td>Kennedy Odongo</td>
          <td>Washington State University</td>
          <td>rodgers.r.odongo@gmail.com</td>
        </tr>
      </tbody>
    </table>'
  ),
  
  width = 12
  
)
