---
title: "case_study"
runtime: shiny
output: html_document
params:
  selected_dataset: 5
  selected_query_type: 2
  query_count_table: NA
  selected_paper_id: 1
---





## Query Generation

Below are the query components that were generated for dataset params$selected_dataset.



## Semantic Search

Each of the six queries returned X potentially relevant papers.


<!--html_preserve--><div class="form-group shiny-input-container">
<label class="control-label" id="selected_dataset-label" for="selected_dataset">Select dataset number</label>
<div>
<select id="selected_dataset"><option value="189" selected>189</option>
<option value="154">154</option>
<option value="160">160</option></select>
<script type="application/json" data-for="selected_dataset" data-nonempty="">{"plugins":["selectize-plugin-a11y"]}</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="form-group shiny-input-container">
<label class="control-label" id="selected_query_type-label" for="selected_query_type">Select query type</label>
<div>
<select id="selected_query_type"><option value="1" selected>1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option></select>
<script type="application/json" data-for="selected_query_type" data-nonempty="">{"plugins":["selectize-plugin-a11y"]}</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div id="out0851058bb9ff4f7f" class="shiny-html-output"></div><!--/html_preserve-->

| test1| test2|
|-----:|-----:|
|     1|    11|
|     2|    12|
|     3|    13|
|     4|    14|
|     5|    15|
|     6|    16|
|     7|    17|
|     8|    18|
|     9|    19|
|    10|    20|

## Topic Modeling

Out of the XX papers returned across the six query types, YYY had abstracts available in either the NLP4Dev or Semantic Scholar corpuses, and ZZZ had full body text available.

These were used as inputs to the NLP4Dev API, as described in Section 3.5.

XXX were defined as relevant.

##my version

```
## Error in force(default): object 'params' not found
```

<!--html_preserve--><div id="outaf2d481f0815e7f7" class="shiny-html-output"></div><!--/html_preserve-->


##code template below


| query_type|total_result_count |full_text_available |abstract_only |relevant |
|----------:|:------------------|:-------------------|:-------------|:--------|
|          1|NA                 |NA                  |NA            |NA       |
|          2|NA                 |NA                  |NA            |NA       |
|          3|NA                 |NA                  |NA            |NA       |
|          4|NA                 |NA                  |NA            |NA       |
|          5|NA                 |NA                  |NA            |NA       |
|          6|NA                 |NA                  |NA            |NA       |


## Model Output

Following manual review of the papers identified automatically, XXX were confirmed as relevant. Of these XXX, YYY had previously been identified through the manual procedure, and ZZZ were new.

This represents a XXX percent improvement over the baseline.



## Evaluating Model Performance

Based on our selected evaluation metric, Query X performed most effectively.

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> x </th>
  </tr>
 </thead>
<tbody>
  <tr>

  </tr>
</tbody>
</table>

## Network Analysis

Below is the distribution of fields and geographic locations identified among the papers that referenced this dataset.


