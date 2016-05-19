#' ---
#' title: "Example of Compiled Notebook"
#' author: "Andrew Duncan"
#' date: ""
#' output: html_document
#' ---




#+ setup, include = FALSE
knitr::opts_chunk$set(echo = TRUE, eval = TRUE, comment = NA, message = F, warning = F)
# YAML Header and knitr chunk options aren't explicitly necessary but 
# make everything look a little neater.

#' We change between Rmarkdown, knitr and normal comments by using different types
#' of hashtags. 
#' 
#' - `#` Everything after this hashtag is a normal R comment
#' - `#'` Everything after this is Rmarkdown
#' - `#+` Everything after this is knitr options
#' 
#' 
#' 
#' ## A Heading
#' 
#' 
#' Some more text explaining what we are going to do...
#' 
#' ### Some R

#+ cars
# Some R
# loading packages
library(dplyr)
# Calculating average mpg of cars by number of cylinders in engine
mtcars %>% 
  group_by(cyl) %>%
  select(mpg, hp) %>%
  summarise_each(funs(mean))

