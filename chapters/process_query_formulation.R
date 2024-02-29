library(here)
library(stringr)
here::i_am("chapters/process_query_formulation.R")

metadata <- readxl::read_excel(here::here("data/overview_all_datasets_2022_categorized.xlsx"),sheet = "Categorized")

dfq <- data.frame(fullname_shortcode = paste0(metadata$Category," ",metadata$abbreviation)
                  ,fau_short = sapply(metadata$authoring_entity,stringr::str_split_i,",",1) # Authoring entity short
                  ,fau_long = metadata$authoring_entity #Authoring entity long
                  ,name = metadata$nation # Extract nation
                  ,year = metadata$year_end # extract year
                  ,short_code = metadata$abbreviation
                  ,full_name =  metadata$Category
                  ,id = as.integer(metadata$id)
                  ,shortcode_fullname = paste0(metadata$abbreviation, " ", metadata$Category)) %>%
  mutate(
    query_type1 = paste0(fau_short, " ", name, " ",year," ",short_code) #type 1
    ,query_type2= paste0(fau_short, " ", name, " ",year," ",full_name) #2
    ,query_type3 = paste0(fau_short, " ", name, " ",year," ",shortcode_fullname) #3
    ,query_type4 = paste0(fau_long, " ", name, " ",year," ",short_code) # 4
    ,query_type5 = paste0(fau_long, " ", name, " ",year," ",full_name) # 5
    ,query_type6 = paste0(fau_long, " ", name, " ",year," ",shortcode_fullname) #6
    
  )


