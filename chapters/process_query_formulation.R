
metadata <- readxl::read_excel("C:/Users/ofatunde/Dropbox/World Bank JDC Fellowship/Project work/Microdata library/Microdata/r-book/data/overview_all_datasets_2022_categorized.xlsx",sheet = "Categorized")


data["fullname_shortcode"] = data["Category"]+ " "+ data["abbreviation"]