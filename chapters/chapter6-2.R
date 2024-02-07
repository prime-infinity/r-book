# chapters/chapter6.R

chapter6_2_ui <- box(
  
  
  h3("4.4. Evaluating Model performance"),
  
  p("Because each model has unique inputs and outputs, we can evaluate each model on some relevant performance metric. Our main aim is to evaluate how effective each model is at returning the highest number of potentially relevant results that are subsequently confirmed to be truly relevant.
  "),
  
  p("There are several metrics that we could use to evaluate the performance of each iteration of the analysis pipeline, each of which is uniquely defined by 1) the query generation method, 2) our choice of topic model, and 3) the specification of the relevance function.
  "),
  
  p("We considered several options, which are listed below."),
  
  HTML(
    '<table class="table">
    <thead>
      <tr>
        <th></th>
        <th>Evaluation metric</th>
        <th>Definition</th>
        <th>Benefits</th>
        <th>Other considerations</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>Precision</td>
        <td>xx</td>
        <td>xx</td>
        <td>xx</td>
      </tr>
      <tr>
        <td>2</td>
        <td>Recall</td>
        <td>xx</td>
        <td>xx</td>
        <td>xx</td>
      </tr>
      <tr>
        <td>3</td>
        <td>Percent unique</td>
        <td>xx</td>
        <td>xx</td>
        <td>xx</td>
      </tr>
    </tbody>
  </table>'
  ),
  
  p("Our primary metric will be XXX based on the work of YYY."),
  
  width = 12
)

