library(dplyr)
library(ggplot2)
library(googledrive)

# Function to read a file from Google Drive
read_file_from_google_drive <- function(file, fun, ...) {
  temp_file <- tempfile(fileext = ".txt")
  
  # Download the specified file from Google Drive and save it to the temporary file
  googledrive::drive_download(
    file = file,
    path = temp_file
  )
  
  # Check if the file has a .RDS extension
  if (tools::file_ext(file) == "RDS") {
    # If the file is an RDS file, directly read it using readRDS
    data <- readRDS(temp_file)
  } else {
    # If it's not an RDS file, read the contents using the specified function (fun)
    data <- fun(temp_file, ...)
  }
  
  # Return the data read from the file
  data
}

country_mention_heat_map <- function(dataset_number,query_type) {
  ## ----Install and load R packages-----------------
  #if (!require("tidyverse")) install.packages("tidyverse")
  #if (!require("rnaturalearth")) install.packages("rnaturalearth")
  #if (!require("sf")) install.packages("sf")
  #if (!require("wbstats")) install.packages("wbstats")
  
  #library(tidyverse)
  #library(rnaturalearth) # World Map Data from Natural Earth
  #library(sf) # Geographic Simple Features in R
  #library(wbstats) # access World Bank API
  
  ## ----Download world data-------------------------
  #world <- rnaturalearth::ne_countries(scale="medium", returnclass="sf") %>%
  #filter(admin != "Antarctica")
  
  
  world <- read_file_from_google_drive("world.RDS", readRDS)
  window_coord_sf <- read_file_from_google_drive("window_coord_sf.csv", read.csv)
  
  ## ----Change World map projection-----------------
  # Mollweide proj
  target_crs <- "+proj=moll"
  
  world_moll <- world %>%
    sf::st_transform(crs = target_crs)
  
  #world_moll <- readRDS(here::here("data/world_moll.RDS"))
  
  ## ----Get data for comparison---------------
  
  ##REPLACE THIS DATA WITH SOMETHING THAT REPRESENTS THE DATA DISTRIBUTION IN THE SEARCH RESULTS. The dataset number should be an input
  
  df <- as.data.frame(world_moll) %>% 
    dplyr::select(name,name_long,formal_en,name_sort,iso_a3) %>%
    mutate(country_mentions = sample(1:10,nrow(world_moll), replace = T))
    
  
  ## ----Plot African countries only----------------
  world_moll %>%
   left_join(df) %>% 
    #filter(continent == "Africa") %>%
    ggplot() + 
    geom_sf(aes(fill = country_mentions)) +
    # window of the map
    # coord_sf(
    #   xlim = window_coord_sf[, "X"],
    #   ylim = window_coord_sf[, "Y"],
    #   expand = FALSE
    # ) +
    scale_fill_viridis_c(
      #trans = "sqrt", 
      labels = scales::label_number(scale = 1,accuracy = 1)#,
      #breaks = c(1:5)^2
    ) +
    # fix labels if needed: https://stackoverflow.com/a/60733863
    scale_x_continuous(
      labels = function(x) paste0(x, '\u00B0', "W")
    ) +
    scale_y_continuous(
      labels = function(x) paste0(x, '\u00B0', "N")
    ) +
    theme_bw() +
    theme(panel.background = element_rect(fill = "aliceblue")) +
    labs(
      title = paste0("Country mentions: dataset ", dataset_number, ", query ", query_type),
      fill = NULL,
      caption = "Source: Semantic Scholar"
      #caption = paste("Source:", indicator_info$source_org) 
    ) +
    theme(plot.title = element_text(hjust = 0.5))
}

# Define the calculate_relevance_for_pair R function
calculate_relevance_for_pair <- function(paper_id, 
                                         dataset_number,
                                         abstract_or_full_text, 
                                         topic_39_percentage_abstract,
                                         topic_39_percentage_full_text, 
                                         jdc_tag_count_abstract, 
                                         jdc_tag_count_full_text, 
                                         majority_country_abstract, 
                                         majority_country_full_text, 
                                         relevance_threshold) {
  # Use reticulate to call the calculate_relevance Python function
  #result <- py$calculate_relevance(paper_id, dataset_number,topic_39_percentage, jdc_tag_count, majority_country)
  
  dataset_country <- metadata$nation[metadata$id == dataset_number][1]
  dataset_name <- metadata$title[metadata$id == dataset_number][1]
  
  if(abstract_or_full_text == "full_text"){
    if (topic_39_percentage_full_text > relevance_threshold & dataset_country == majority_country_full_text){
      relevance = 1
    } else if (topic_39_percentage_full_text > relevance_threshold & dataset_country != majority_country_full_text) {
      relevance = 0.5
    } else{
      relevance = 0
    }
    
    result <- data.frame(paper_id,dataset_number, dataset_name,relevance,topic_39_percentage_full_text,jdc_tag_count_full_text,majority_country_full_text)
    colnames(result) <- c("Paper ID","Dataset Number","Dataset Name","Relevance","Forced Displacement Content", "JDC Tags Used", "Focal Country")
    
    
  } else if (abstract_or_full_text == "abstract") {
    if (topic_39_percentage_abstract > relevance_threshold & dataset_country == majority_country_abstract){
      relevance = 1
    } else if (topic_39_percentage_abstract > relevance_threshold & dataset_country != majority_country_abstract) {
      relevance = 0.5
    } else{
      relevance = 0
    }
    
    result <- data.frame(paper_id,dataset_number, dataset_name,relevance,topic_39_percentage_abstract,jdc_tag_count_abstract,majority_country_abstract)
    colnames(result) <- c("Paper ID","Dataset Number","Dataset Name","Relevance","Forced Displacement Content", "JDC Tags Used", "Focal Country")
    
  }
  
    return(result)
}

#pull in list of related pubs from JDC website
get_related_pubs <- function(dataset_number) {
  url = URLencode(paste0("https://microdata.unhcr.org/index.php/catalog/",dataset_number,"/related-publications"))
  page1 <<- xml2::read_html(url)
  # extract all links
  nodes <<- rvest::html_nodes(page1, "a")
  links <<- rvest::html_attr(nodes,"href")
  # extract first link of the search results
  link <<- links[grepl("https://microdata.unhcr.org/index.php/citations",links)]
  # clean it
  link <<- sub("^/url\\?q\\=(.*?)\\&sa.*$","\\1", link)
  
  df <- data.frame(matrix(link))
  colnames(df) <- "links"
  return(df)
}



#for each related pub, pull the structured fields
get_pub_fields <- function(dataset_number) {
  related_pub_links <<- get_related_pubs(dataset_number)
  
  related_pub_table <<- data.frame()
  
  for(i in 1:nrow(related_pub_links)) {
    address <- related_pub_links$links[i]
    # extract all links
    page_content <<- read_html(address)
    tables <<- page_content %>% html_table(fill = TRUE)
    first_table <<- tables[[1]]
    
    sub_tables <<-data.frame(ref_no = i) %>% 
      cbind(first_table %>% 
              column_to_rownames(var = "X1") %>% t) %>% 
      `row.names<-`(., NULL) 
    
    related_pub_table <<- related_pub_table %>%
      rbind.fill(sub_tables)
    
    
    related_pub_table_v2 <<- related_pub_table %>%
      rowwise %>%
      mutate(Publication = str_extract(Type,"(?<= - ).*")
             ,Type = str_trim(str_extract(Type,".*(?= - )"))
      ) %>%
      relocate(Publication, .after = Type)
  }
  
  
  return(related_pub_table_v2)
}

# see more at "C:/Users/ofatunde/Dropbox/World Bank JDC Fellowship/Project work/Microdata library/Microdata/unhcr-microdata/extraction_and_comparison_pipeline_v2.R"