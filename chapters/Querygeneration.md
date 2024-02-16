---
title: "Query Generation Report"
output: 
  html_document:
    keep_md: true
---


## Query Generation
We begin by generating a set of search queries based on the metadata for each dataset.

The full query creation notebook can be found [here](https://github.com/ofatunde/mdl-explorer-app/blob/main/notebooks/Semantic_Scholar_NLP4DEV.ipynb).

We start with simple methods of combining the metadata. The key metadata components that we use as an input into queries are:
* Core survey name
* Survey abbreviation (e.g., VaSyR)
* Lead organization (e.g., UNHCR) - short or long versions may be used
* Category (e.g., Socioeconomic Asessment of Refugees)
* Country
* Year  
For our initial exploration, we define six simple query types which represent different combinations of the information above :

* __Query type 1:__ lead_org_short + year + name + shortcode
* __Query type 2:__ lead_org_short + year + name + full_name
* __Query type 3:__ lead_org_short + year + name + shortcode_fullname
* __Query type 4:__ lead_org_long + year + name + shortcode
* __Query type 6:__ lead_org_long + year + name + shortcode_fullname

Defining query structure is an important step, as the search output can be sensitive to the contents of the query used for the search. For example, the six queries above return different number of results if entered into Semantic Scholar. 

The table below shows the number of results returned by Semantic Scholar for each dataset.

```python
import pandas as pd

df = pd.read_csv("semantic_scholar_query_results_with_web_count.csv")
df
```

```
##       id  query_type1_pubs  ...  query_type6_pubs  no_related_pubs_jdc_website
## 0     16                93  ...                 0                            0
## 1    114                12  ...                 2                            1
## 2    131                 3  ...                 0                            0
## 3    132                34  ...                 0                            0
## 4    136                15  ...                 2                            2
## ..   ...               ...  ...               ...                          ...
## 478  699                 2  ...                 0                            0
## 479  700                 2  ...                 0                            0
## 480  701                 1  ...                 0                            0
## 481  703                 6  ...                 0                            0
## 482  704                 0  ...                 0                            0
## 
## [483 rows x 8 columns]
```

Each of these query strings is subsequently passed into the Semantic Scholar API. The following function generates a single query which can serve as an argument into another function.

```{code-cell}
# This function takes in the name of our dataframe, the id of the data set and the query number and returns the query.
def query_finder(df_name: pd.DataFrame, dataset_id: int = 189, query_number:int =1 )->str:
    """ Function takes in the query dataframe, the dataset ID and the query type number and retuns the query itself"""
    df_indexid = df_name.set_index('id')
    query = df_indexid.loc[189][f"query_type{query_number}"]
    return query 
```

Future work will draw on more sophisticated methods of constructing queries.

### Next steps
After generating these queries, we treat them as inputs to the Semantic Scholar API. See [the next section](methods/semantic-search.md) for more details.