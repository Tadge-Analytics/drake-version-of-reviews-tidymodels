download_data <- function() {
  
  url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00331/sentiment%20labelled%20sentences.zip"
  download.file(url, destfile = "download.zip")
  unzip("download.zip", exdir = "data")
  
}