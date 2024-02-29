source(here::here("chapters/process_query_formulation.R"))

# Create a data frame for displaying results
start_queries <- data.frame()


for (j in unique(dfq$id)){
  for (i in 1:6){
    # Build file path based on user input
    file_path <- here::here(paste0("data/query_results/dataset", j, "_query", i, ".csv"))
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
