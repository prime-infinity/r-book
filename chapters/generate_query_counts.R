source(here::here("chapters/process_query_formulation.R"))
library(googledrive)

# Create a data frame for displaying results
start_queries <- data.frame()

# Function to generate the file path based on user input
generate_csv_file_path <- function(dataset_id, query_type) {
  here::here(paste0("data/query_results/dataset", dataset_id, "_query", query_type, ".csv"))
}

read_file_from_google_drive <- function(file, fun, ...) {
  temp_file <- tempfile(fileext = ".txt")
  googledrive::drive_download(
    file = file,
    path = temp_file
  )
  data <- fun(temp_file, ...)
  data
}

for (j in unique(dfq$id)){
  for (i in 1:6){
    # Build file path based on user input
    file_path <- generate_csv_file_path(j, i)
    query_results_data <- read_file_from_google_drive(file_path, read.csv)
    #ERROR HANDLING
    possibleError <- tryCatch(
      #   Build file path based on user input
      temp_file <- read.csv(file_path),
      error=function(e) e
    )
    
    if(inherits(possibleError, "error")) next
    
    #REAL WORK
    start_queries <- start_queries %>% rbind(temp_file)
    #print(i)
  }  
  #print(j)
}

  
all_query_counts <- start_queries

#saveRDS(all_queries,here::here("data/query_results/all_query_counts.RDS"))
