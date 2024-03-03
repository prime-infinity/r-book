source(here::here("chapters/process_query_formulation.R"))
source(here::here("chapters/helper_functions.R"))
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

# Load Python script with calculate_relevance function
#source_python(here::here("chapters/relevance_calculator.py"))
abstract_or_full_text <- read_file_from_google_drive("valid_abstract_and_body_text.csv", read.csv)
all_query_counts <- readRDS(here::here("data/query_results/all_query_counts.RDS"))

#all_query_counts <- read_file_from_google_drive("query_results/all_query_counts.RDS", readRDS)


#Topic Modeling setup
your_csv_data_1 <- read_file_from_google_drive("topic39_summary_abstract_body.csv", read.csv)
your_csv_data_2 <- read_file_from_google_drive("majority_country_summary_abstract_body.csv", read.csv)
your_csv_data_3 <- read_file_from_google_drive("jdc_count_summary_abstract_body.csv", read.csv)
topics_countries_tags <- your_csv_data_1 %>% 
  dplyr::left_join(your_csv_data_2, by = "paper_id") %>% 
  dplyr::left_join (your_csv_data_3, by = "paper_id") %>% 
  dplyr::left_join(abstract_or_full_text, by = "paper_id") %>% 
  dplyr::filter(topic_39_abstract >0
                | topic_39_full_text >0
                | abstract_majority_country != "NONE"
                | body_majority_country != "NONE"
                | jdc__tag_count_abstract > 0
                | jdc__tag_count_full_text > 0
                | Full.Text.Status == "Output for Full Text"
                | Abstract.Status == "Output for Abstract"
  ) %>% 
  dplyr::rename(Abstract_Topic39 = topic_39_abstract,
                Full_Text_Topic39 = topic_39_full_text,
                Abstract_Majority_Country = abstract_majority_country,
                Body_Majority_Country = body_majority_country,
                Abstract_Tag_Count = jdc__tag_count_abstract,
                Full_Text_Tag_Count = jdc__tag_count_full_text)  %>% 
  #mutate(countries_vector_abstract = map(Abstract_Majority_Country, str_split_1, pattern = ","),
   #      countries_vector_full_text = map(Body_Majority_Country, str_split_1, pattern = ",")
    #     ) %>% 
  janitor::clean_names()
