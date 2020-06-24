library(tidyverse)
library(httr)
library(tidytext)
library(tidymodels)
library(textrecipes)
library(vip)
library(drake)






split_the_data <- function(prepared_files_data) {
  
  set.seed(123)
  review_split <- initial_split(prepared_files_data, strata = sentiment)
  
  review_train <- training(review_split)
  review_test <- testing(review_split)
  
  
  return(
    
    list(review_split = review_split,
         review_train = review_train,
         review_test = review_test)
  )
  
  # this will allow me to call for each part using object$review_split, ect
  # good idea?
  
}











plan <- drake_plan(
  
  download_data = download_data(),
  
  prepared_files_data = load_and_prepare_data(),
  
  splits = split_the_data(prepared_files_data)
    

  
)


make(plan)


