pollutantmean<-function(directory='specdata',pollutant,id=1:332){
  
  getFilenames <-function(allids){
    allFilenames = sapply(allids,function(oneid){
      oneid = str_pad(oneid,3,pad='0');
      paste(directory,'/',oneid,'.csv',sep='');
    })
    return(allFilenames);
  }
  getTableOfResults<-function(){
    tableOfResults=c();
    for(i in 1:length(id)){
      singleResult = getSingleResult(id[i]);
      tableOfResults =rbind(tableOfResults,singleResult);
    }
    return(tableOfResults);
  }
  
  
  getSingleResult<-function(oneid){
    oneFilename = getFilenames(oneid);
    dataset = read.csv(oneFilename);  # open csv
    sulfateValues = dataset[,'sulfate'];  # get vector of sulfate values
    sulfateValues = sulfateValues[!is.na(sulfateValues)];  # remove NA's
    nSulfate= length(sulfateValues);  # get n and sum
    sumSulfate = sum(sulfateValues);
    
    nitrateValues = dataset[,'nitrate'];# get vector of nitrate values
    nitrateValues = nitrateValues[!is.na(nitrateValues)];  # remove NA's
    nNitrate= length(nitrateValues);  # get n and sum
    sumNitrate = sum(nitrateValues);
    
    result= c(oneid,nSulfate,sumSulfate,nNitrate,sumNitrate);
    result = setNames(result,c('id','nSulfate','sumSulfate','nNitrate','sumNitrate'));
    return(result);
  }
  
  getTotalMean <-function(){
    if(pollutant =='sulfate'){
      totalnSulfate = sum(tableOfResults[,'nSulfate']);
      totalsumSulfate = sum(tableOfResults[,'sumSulfate']);
      meanSulfate = totalsumSulfate/totalnSulfate;
      return(meanSulfate);
    }
    else if(pollutant =='nitrate'){
      totalnNitrate = sum(tableOfResults[,'nNitrate']);
      totalsumNitrate = sum(tableOfResults[,'sumNitrate']);
      meanNitrate = totalsumNitrate/totalnNitrate;
      return(meanNitrate);
    }
    else return("pollutant not recognised as sulfate or nitrate");
  }
  tableOfResults = getTableOfResults();

  totalMean= getTotalMean();
  return(totalMean);
}



