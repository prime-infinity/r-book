#check that all names are valid

library(tidyr)

unique_country_list <- topics_countries_tags %>% 
  distinct(countries_vector_abstract) %>% 
  rename(country_list = countries_vector_abstract) %>% 
  rbind(topics_countries_tags %>% 
          distinct(countries_vector_full_text) %>% 
          rename(country_list = countries_vector_full_text)
) %>% distinct #%>% 
  # mutate(country_list = map(country_list,noquote)) %>% 

unique_country_list$country_list <- gsub("c(","",unique_country_list$country_list, fixed=TRUE)
unique_country_list$country_list <- gsub(")","",unique_country_list$country_list, fixed=TRUE)
unique_country_list$country_list <- gsub('"','',unique_country_list$country_list, fixed=TRUE)

unique_country_list <- unique_country_list %>% 
  #mutate(country_list = map(country_list,noquote) %>% 
  separate(country_list,into = c("country1",
                                 "country2",
                                 "country3",
                                 "country4",
                                 "country5",
                                 "country6",
                                 "country7",
                                 "country8",
                                 "country9",
                                 "country10")
           ,sep = ",")

single_country_list <- tidyr::gather(unique_country_list) %>% 
  dplyr::select(value) %>% 
  mutate(value = trimws(value)) %>% 
  distinct

#values that already match the naming convention for the map
dim(single_country_list %>% filter(value %in% world$name))

#Values that don't
non_matches <- single_country_list %>% filter(!value %in% world$name)

#to_correct:
  
str_replace_all("Türkiye","Turkey")
