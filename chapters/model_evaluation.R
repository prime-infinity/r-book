library(dplyr)
library(rvest)
library(stringr)
#library(tabulizer)
library(here)
library(mdl)
library(xml2)
library(httr)
library(tibble)
library(plyr)
library(jsonlite)
library(pdftools)
#get related papers from library and compare

for (i in unique(metadata$id[metadata$id!=189])){
  possibleError <- tryCatch(
      #   Build file path based on user input
    b <- get_pub_fields(i),
        error=function(e) e
      )

      if(inherits(possibleError, "error")) next

  #   #REAL WORK
  write.csv(b,here::here(paste0("chapters/mdl_related_pubs/mdl_site_related_pubs_",i,".csv")))

print(i)

}



# for a given dataset

related_pubs_189 <- read.csv(here::here("chapters/mdl_related_pubs/mdl_site_related_pubs_189.csv"))

SS_results_189 <- all_query_counts %>% filter(dataset_id == 189)

#non-unique papers
length(related_pubs_189$Title [related_pubs_189$Title %in% SS_results_189$title])


related_pub_summary <- read.csv(here::here("data/semantic_scholar_query_results_with_web_count.csv"))

ggplot(related_pub_summary) + 
  geom_histogram(aes(x = no_related_pubs_jdc_website))+
  theme_classic()+
  ggtitle("Number of manually generated related publications on UNHCR MDL")+
  xlab("Related publication count")+
  ylab("Number of datasets")+
  theme(plot.title = element_text(hjust = 0.5))

