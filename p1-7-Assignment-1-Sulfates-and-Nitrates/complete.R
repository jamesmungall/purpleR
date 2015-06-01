complete <- function(directory='specdata', id = 1:332) {
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
  
  
  getFilenames <-function(allids){
    allFilenames = sapply(allids,function(oneid){
      oneid = str_pad(oneid,3,pad='0');
      paste(directory,'/',oneid,'.csv',sep='');
    })
    return(allFilenames);
  }
  getTableOfResults<-function(){
    tableOfResults=data.frame();
    for(i in 1:length(id)){
      singleResult = getSingleResult(id[i]);
      tableOfResults =rbind(tableOfResults,singleResult);
    }
    colnames(tableOfResults)<-c('id','nobs');
    return(tableOfResults);
  }
  
  getSingleResult<-function(oneid){
    oneFilename = getFilenames(oneid);
    dataset = read.csv(oneFilename);  # open csv
    completeCasesDataset=dataset[complete.cases(dataset),];
    numberOfCompleteCases<-nrow(completeCasesDataset);
    result= c(oneid,numberOfCompleteCases);
    return(result);
  }
  
  tableOfResults = getTableOfResults();
  return(tableOfResults);
}