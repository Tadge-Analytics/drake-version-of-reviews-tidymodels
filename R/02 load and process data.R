load_and_prepare_data <- function() {
  
  prepared_files_data <- 
    dir("data", recursive = T, full.names = T, pattern = "*.txt") %>% 
    tibble(file = .) %>% 
    filter(!str_detect(file, "readme.txt")) %>% 
    mutate(data = map(file, ~read_lines(.x))) %>% 
    unnest(data) %>% 
    mutate(sentiment = as.numeric(str_sub(data, -1)),
           sentiment = if_else(sentiment == 1, "good", "bad") %>% as.factor(),
           review = str_sub(data, 1, nchar(data)-1) %>% trimws(),
           source = word(file, -1, sep = "/"),
           source = word(source, 1, sep = "_"),
           review_id = row_number()) %>% 
    select(-data, -file)
  
  return(prepared_files_data)
  
}