# chapters/chapter2.R

chapter2_ui <- box(
  
  title = "Chapter 1 Context",
      
  p("The ", a("UNHCR Microdata Library", href = "https://microdata.unhcr.org/index.php/home", title = "MDL Homepage", target = "_blank"), " is a public resource, and there are opportunities to align its functionality with the needs of the research community."),
  
  p("We want to 1) better understand the impact it’s having, and 2) optimize it and understand the needs of the research community (what they need and why) so we can better support them in future."),
  
  p("The library houses over 500 datasets, many of which are individual waves of a repeated survey. Many surveys are conducted in multiple waves, which differ by year, geography, or context. Location can be at the national, regional, or camp level."),
  
  img(src = "chapters/title_anatomy.png", width = "100%", height = "auto"),
  
  p("The UNHCR/GDS Microdata Curation Team currently tracks usage of datasets through a semi-manual process."),
  
  p("This process is time-consuming, and also likely to miss entries due to being ad hoc."),
  
  p("The goal of this project was to automate and extend the current procedure to increase efficiency and provide deeper insight."),
  
  
  width=12
)

