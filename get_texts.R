# get texts from gutenberg

library(dplyr)
library(gutenbergr)

glimpse(gutenberg_metadata)

joyce <- gutenberg_metadata %>%
    filter(author == "Joyce, James")

joyce_df <- gutenberg_download(joyce$gutenberg_id)
  
glimpse(joyce_df$gutenberg_id)
