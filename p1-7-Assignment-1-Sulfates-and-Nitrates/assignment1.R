Pollutantmean <- function(directory='specdata', pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  # add preceeding zeros
  
  # get first result
  id=1;
  id = str_pad(id,3,pad='0');
  firstResult =getSingleResult(id);
  
  id=2;
  id = str_pad(id,3,pad='0');
  secondResult =getSingleResult(id); 
  
  sulfateResult = c();
  nitrateResult = c();
  resultsTable = c();
  result = list(firstResult = firstResult,secondResult = secondResult);
  return(result);
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!

}
getSingleResult = function(id){
  firstId = id[1];
  #filename
  myFileName =  paste('specdata/',firstId,'.csv',sep='');
  # open csv
  dataset1 = read.csv(myFileName);
  # choose sulfate or nitrate

  
  result = getSulfate(dataset1);
  return(result);
}
getSulfate = function(dataset){
  # get vector of sulfate values
  sulfateValues = dataset[,'sulfate'];
  # remove NA's
  sulfateValues = sulfateValues[!is.na(sulfateValues)];
  # get n and sum
  nSulfate= length(sulfateValues);
  sumSulfate = sum(sulfateValues);
  sulfateResult= list(nSulfate=nSulfate,sumSulfate=sumSulfate);
  return(sulfateResult);
}
getNitrate = function(dataset){
  # get vector of nitrate values
  nitrateValues = dataset[,'nitrate'];
  # remove NA's
  nitrateValues = nitrateValues[!is.na(nitrateValues)];
  # get n and sum
  nNitrate= length(nitrateValues);
  sumNitrate = sum(nitrateValues);
  nitrateResult= list(nNitrate=nNitrate,sumNitrate=sumNitrate);
  return(nitrateResult);
}