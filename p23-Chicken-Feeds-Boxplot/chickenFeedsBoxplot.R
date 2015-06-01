chickenFeedsBoxPlot<-function(){
# Chicken Feeds - Boxplot           p23, purple book 1.6.15
#----------------------
# 
# ref: http://www.cookbook-r.com/Graphs/Box_plot/
# 
# We can clearly show that the chicken weights are 
# affected by feed type by drawing boxplots. Data is of the form
#
#     weight    feed
#     --------------
#     179       horsebean       71obs, with 6 feed factors
#
# To draw boxplots, use boxplot( dataValuesColumn ~ variables, dataframe)
# In this case;
boxplot(weight ~ feed, chickwts);


}
