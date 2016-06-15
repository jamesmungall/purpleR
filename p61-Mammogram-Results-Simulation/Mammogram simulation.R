mam_sim <- function(){
  Pr_no_cancer <- 0.925
  Pr_cancer <- 0.075
  Pr_pos_res_canc <- 0.9
  Pr_pos_res_no_canc <- 0.1
 
  number_with_cancer <- rbinom(1,200,Pr_cancer)
  number_without_cancer <- 200 - number_with_cancer
  
  number_pos_res_cancer <- rbinom(1,number_with_cancer, Pr_pos_res_canc)
  number_pos_res_no_cancer <- rbinom(1,number_without_cancer, Pr_pos_res_no_canc)
  
  result <- data.frame(result_names <- c('Positive result, have cancer', 'Positive result, no cancer'),
                       result_values <- c(number_pos_res_cancer, number_pos_res_no_cancer))

  
  ggplot(data=result, aes(x=result_names, y=result_values)) + geom_bar(stat="identity")
}