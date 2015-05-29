
islandsVector<-function(){
# 
# Subsetting a Named Vector         27.5.15
# -------------------------
# 
# Purple book page 13
# ref: R for dummies chapter 7
# 
# Example 1.  The buit in 'islands' dataset is a named vector where each
# value is the areas in thousands of square miles of each of the islands
# named.
#    Africa   Antarctica         Asia    Australia Axel Heiberg ...
#     11506         5500        16988         2968           16 ...

# The table below shows the results of subsetting this vector

# Command            result                         str(result)              
# ------------------------------------------------------------------------------------
# islands           Africa Ant..                    Named num 11506             
#                   11506   5500...                 attr(names)=chr "Africa"...
# ------------------------------------------------------------------------------------
# islands[]       identical to islands
# ------------------------------------------------------------------------------------
# islands[[1]]      11506                           num 11506                   
# ------------------------------------------------------------------------------------
# islands[['Africa']]   identical to islands[[1]]
# ------------------------------------------------------------------------------------
# islands[1]        Africa                          Named num 11506
#                   11506                           attr("names")=chr "Africa" 
# ------------------------------------------------------------------------------------
# islands['Africa']       identical to islands[1]
# ------------------------------------------------------------------------------------
# islands$Africa    $ operator is invalid for atomic vectors
# ------------------------------------------------------------------------------------
# islands[c('Africa','Asia')]                       Named num [1:2] 11506 16988
#                   Africa   Asia                   attr(*, "names")= 
#                    11506  16988                        chr [1:2] "Africa" "Asia"
# ------------------------------------------------------------------------------------
# islands[c(1,2)]   identical to islands[c('Africa','Asia')]
# ------------------------------------------------------------------------------------
# islands[islands==max(islands)]                    Asia
#                                                   16988
# ------------------------------------------------------------------------------------
# quantile(islands)               0%      25%      50%      75%     100% 
#                                 12.00    20.50    41.00   183.25 16988.00 
# ------------------------------------------------------------------------------------
#  islands[islands<15]
# Hainan          Kyushu Prince of Wales          Taiwan           Timor  Vancouver 
# 13              14              13              14              13      12
# ------------------------------------------------------------------------------------
# islands[islands>2000]
#        Africa    Antarctica          Asia     Australia        Europe North America South America 
#         11506          5500         16988          2968          3745          9390          6795 
# ------------------------------------------------------------------------------------
#
# Summary:
#     Using a name or index within a single set of square brackets returns a named vector of length 1.
#     Using a name or index within a double set of square brackets returns an unnamed vector of length 1.
#     Using a vector of names or indices returns a named vector, with length equal to the number
#     of names or indices used.
#     There is no double-square-brackets equivalent to return an unnamed vector for more than one value.
#     Using a vector of booleans with the same length as the original vector produces a subset, as was 
#     demonstrated in getting the largest and smallest islands in the list.
}
