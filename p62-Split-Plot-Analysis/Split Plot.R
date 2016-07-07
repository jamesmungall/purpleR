sp1 <- function(){
  
  alf <- read.delim("~/MyR/Regression/split_plot.txt")
  attach(alf)
#block  date	variety	yield
#	1 	  A   	Ladak 	2.17
#	1	    B	    Ladak	  1.58
# ...  
  
  # We split the ANOVA table and create a main-pot and sub-plot section.
  # In the main plot section we bundle all the dates (A,B,C, D)
  # and do an ANOVA table based upon the sum of each set of 4 dates. 
  # We can include blocking for the 6 blocks. 
  # We then work out a sub-plot ANOVA table by taking difference of grand totals & main block totals.

  n <- nrow(alf) # n is 72
  correction_term <- sum(yield)^2 / n
  ct <- correction_term
  Total_df <- n-1
  Total_SS <- sum(alf$yield^2)/(n/n) - ct

  
  main_plot <- alf %>% group_by(block, variety) %>% summarise(block_date_totals=sum(yield))
View(main_plot)
# block  variety	block_date_totals
#	1	    Cossack	  7.84
#	1	    Ladak	    8.27
#	1   	Ranger   	6.38
#	2   	Cossack	  6.82
# ...
  main_plot_n <- nrow(main_plot)
  main_plot_df <- main_plot_n-1
  main_plot_SS <- sum(main_plot$block_date_totals^2)/(n/main_plot_n) - ct

  main_plot_blocks <- main_plot %>% group_by(block) %>% summarise(block_totals=sum(block_date_totals))
View(main_plot_blocks)
# block	block_totals
#	1   	22.49
#	2   	20.32
#	3   	21.44
#	4   	20.01
#	5 	  16.47
#	6	    14.24

  main_plot_blocks_n <- nrow(main_plot_blocks)
  main_plot_blocks_df <- main_plot_blocks_n - 1
  main_plot_blocks_SS <- sum(main_plot_blocks$block_totals^2)/(n/main_plot_blocks_n) - ct

 main_plot_variety <- main_plot %>% group_by(variety) %>% summarise(variety_totals=sum(block_date_totals))
View(main_plot_variety)
#  variety	variety_totals
#	Cossack	  37.72
#	Ladak	    39.99
#	Ranger	  37.26

  main_plot_variety_n <- nrow(main_plot_variety)
  main_plot_variety_df <- main_plot_variety_n - 1
  main_plot_variety_SS <- sum(main_plot_variety$variety_totals^2)/(n/main_plot_variety_n) - ct

}