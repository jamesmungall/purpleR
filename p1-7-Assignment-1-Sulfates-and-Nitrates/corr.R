corr <- function(directory='specdata', threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  id = 1:332;# ultimately id = 1:332
  getFilenames <-function(allids){
    allFilenames = sapply(allids,function(oneid){
      oneid = str_pad(oneid,3,pad='0');
      paste(directory,'/',oneid,'.csv',sep='');
    })
    return(allFilenames);
  } 
  
  getNCasesAboveThreshold<-function(oneid){
    oneFilename <- getFilenames(oneid);
    dataset <- read.csv(oneFilename);  # open csv
    completeCasesDataset=dataset[complete.cases(dataset),];
    return(nrow(completeCasesDataset));
  }

  getVectorOfResults<-function(){
    results=c();
    for(i in 1:length(id)){
      nCasesAboveThreshold <- getNCasesAboveThreshold(id[i]);
      #we only want to calculate correlations if the number of pairs of data is > threshold
      if(nCasesAboveThreshold>threshold){
        singleCorrelation = getSingleCorrelation(id[i]);
        results=c(results,singleCorrelation);
      }
    }
    return(results);
  }
  
  getSingleCorrelation<-function(oneid){
    oneFilename <- getFilenames(oneid);
    dataset <- read.csv(oneFilename);  # open csv
    completeCasesDataset=dataset[complete.cases(dataset),];
    sulfate<-completeCasesDataset[,'sulfate'];
    nitrate<-completeCasesDataset[,'nitrate'];
    oneCorrelation = cor(sulfate,nitrate);
    return(oneCorrelation);
  }
  return(getVectorOfResults());
}