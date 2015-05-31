oldFaithfulRunsTest<-function(){
  # Old Faithful - Runs Test            Purple book p12, 31.5.15
  #--------------------------
  #
  # Does the duration of the Old Faithful eruption depend upon the duration of the 
  # previous eruption?
  #
  # Use built-in faithful dataset, where eruption is the eruption duration in minutes
  # waiting is the waiting time to next eruption in minutes.
  # Eruption  Waiting
  # 3.6       79        eruption is the eruption duration in minutes
  # .         .     272 observations
  #
  #
  # Expected number of runs given Ho: duration independent
  # = n/2 + 1 = 272/2 + 1 = 137
  # Variance of number of runs given Ho: duration independent
  # = (n-1)/ 4 = 67.75
  fe=faithful$eruptions;
  # For each eruption record TRUE if the duration is greater than the mean, and 
  # FALSE if it is less than the mean. We would expect this boolean vector to be
  # randomly distributed if Ho is true.
  booleanVector = fe<mean(fe);
  # Now we need to count the number of runs. This is equal to the number of times
  # the vector changes from TRUE to FALSE or FALSE to TRUE
  numberOfRuns=0; # a vector with a single value.
  for(i in 1:(length(booleanVector)-1)){
    if(booleanVector[i]!=booleanVector[i+1]){
      numberOfRuns = numberOfRuns+1;
    }
  }
  return(numberOfRuns); # returns 188
  # Z-test gives z = 6.3. Therefore reject Ho.
  # Note that the histogram clearly shows short and long duration eruptions, 
  # and the number of runs value of 188 suggests that about 70% of the time
  # the oscillate between the two.
}
