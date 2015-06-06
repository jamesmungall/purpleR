Pollutantmean <- function(directory='specdata', pollutant='sulfate', id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  if(!is_single_string(directory)) {
    stop('directory must be a single string')
  }
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  if(!(pollutant %in% c('sulfate','nitrate'))){
    stop('pollutant must be either sulfate or nitrate')
  }
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  if(!is_numeric_vector(id)){
    stop('id must be a numeric vector')
  }
  
  
  getDataFrameFromId <- function(singleId){
    if(!is_single_positive_integer(singleId)){
      stop('singleId must be a single positive integer')
    }
    paddedId = str_pad(singleId,3,pad='0');
    myFileName =  paste('specdata/',paddedId,'.csv',sep='');
    dataset<-read.csv(myFileName);
    dataset<-tbl_df(dataset);
    result<-
      dataset %>%
#Observations: 3652
#Variables:
#  $ Date    (fctr) 2001-01-01, 2001-01-...
#$ sulfate (dbl) NA, NA, NA, NA, NA, N...
#$ nitrate (dbl) NA, NA, NA, NA, NA, N...
#$ ID      (int) 2, 2, 2, 2, 2, 2, 2, ...
      gather(ion,conc, c(sulfate,nitrate)) %>% 
# Observations: 7304
# Variables:
# $ Date (fctr) 2001-01-01, 2001-01-0...
# $ ID   (int) 2, 2, 2, 2, 2, 2, 2, 2...
# $ ion  (fctr) sulfate, sulfate, sul...
# $ conc (dbl) NA, NA, NA, NA, NA, NA...
  filter(!is.na(conc)) %>% 
#  Observations: 2092
#Variables:
#  $ Date (fctr) 2001-01-19, 2001-01-25, 2001-0...
#$ ID   (int) 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2...
#$ ion  (fctr) sulfate, sulfate, sulfate, sul...
#$ conc (dbl) 2.30, 2.19, 1.20, 2.23, 4.15, 3...
  group_by(ion) %>% 
      summarise(singleDatasetN=n(),singleDatasetSum=sum(conc));
#Observations: 2
#Variables:
#  $ ion            (fctr) sulfate, nitrate
#$ singleDatasetN   (int) 1041, 1051
#$ singleDatasetSum (dbl) 4643.7045, 993.1616
    return(result);
  }
  # get results
  allResults=data.frame();
  for(i in 1:length(id)){
    getDataFrameFromId(id[i]) -> singleResult
    rbind(allResults,singleResult) -> allResults
  }

summaryResults<- 
  allResults %>%
  group_by(ion) %>%
  summarise_each(funs(sum), totalN=singleDatasetN, totalSum=singleDatasetSum) %>%
  mutate(totalMean = totalN/totalSum)
#      ion totalN totalSum totalMean
#1 sulfate   1875 8147.246 0.2301391
#2 nitrate   1901 1638.332 1.1603268
return(summaryResults)

## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!

}

