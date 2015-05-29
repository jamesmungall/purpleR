cumsum_difference<-function(){
# 
# Cumulative Sum & Difference
# ---------------------------
# ref: R for Dummies chapter 4 (end of),p98
#
cumsumExample<-function(){
  # To turn frequency into cumulative frequency, use cumsum
  #
  # Example: Anderson, 'Interpreting Data' page 35
  #
  # Marks Frequency CumulativeFrequency
  # "35-39" 3     
  # "40-44" 6       we want to add this column
  # "45-49" 12
  # "50-54" 15
  # "55-59" 27
  # "60-64" 30
  # "65-69" 18
  # "70-74" 15
  # "75-79" 12
  # "80-84" 12
  
  examMarks<-read.csv('studentExamMarks.csv');
  cumulativeFrequency<-cumsum(examMarks['Frequency']);
  names(cumulativeFrequency)<-'Cumulative Frequency';
  examMarks<-cbind(examMarks,cumulativeFrequency);
  write.csv(examMarks,file="examMarksWithCumFreq.csv",row.names=FALSE);
  return(examMarks);
}

differenceExample<-function(){
  # To calculate differences between vectors, use x - y
  #
  # Example: Wonnacott & Wonnacott pg 530, Paired data
  #
  # X,  Y,    difference
  # 810,800   
  # 860,880   we want to add this column
  # 830,860
  # 950,930
  # 720,760
  # 750,800
  # 750,850
  # 680,740
  pairedSamples<-read.csv('pairedSamples.csv');
  pairedSamplesDifferences<-pairedSamples['X']-pairedSamples['Y'];
  names(pairedSamplesDifferences)<-'difference';
  pairedSamples<-cbind(pairedSamples,pairedSamplesDifferences);
  write.csv(pairedSamples,file='pairedSamplesWithDifferences.csv',row.names=FALSE);
  return(pairedSamples);
}
}