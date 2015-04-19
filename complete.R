complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  filespath <- paste(directory,"/*.csv",sep="")
  
  filesloc <- (Sys.glob(filespath));
  
  nobs <- c()
  
  for (index in id) {
    readfile <- read.csv(filesloc[index], sep = ",");
    completecases <- readfile[complete.cases(readfile),]
    nobs <- c(nobs, nrow(completecases));
  }
  
  return(data.frame(cbind(id, nobs)));

}

