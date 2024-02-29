# relevance_calculator.py

import pandas as pd

def calculate_relevance(ref, dataset, topic_39_percentage, jdc_tag_count, majority_country, relevance_threshold):
    dataset_country = ref.loc[ref['id'] == dataset, 'nation'].iloc[0]

    if (topic_39_percentage > relevance_threshold) and (majority_country == dataset_country):
        relevance = 1
    elif (topic_39_percentage > relevance_threshold) and (majority_country != dataset_country):
        relevance = 0.5
    else:
        relevance = 0

    final_output = pd.DataFrame(list(zip([dataset],[relevance],[topic_39_percentage],[jdc_tag_count])),
                                columns=["Dataset Name","Relevance","topic 39 Percentage", "JDC Tag Counts"])
    return final_output
