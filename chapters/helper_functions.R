library(dplyr)
library(ggplot2)
coverage_heat_map <- function(dataset_number,query_type) {
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
  
  world <- readRDS(here::here("data/world.RDS"))
  window_coord_sf <- read.csv(here::here("data/window_coord_sf.csv"))
  
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
