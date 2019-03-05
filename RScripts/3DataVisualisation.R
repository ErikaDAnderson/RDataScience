#=====================================================================================================
# Script Name: 3DataVisualisation.R
# Script Author: Erika Anderson et al.
# Script Date: 2019-03
# R Version: R version 3.5.2 (2018-12-20) "Eggshell Igloo"
# RStudio: Version 1.1.463
#
# R for Data Science Exercises 
# section 3 Data Visualisation
#
#=====================================================================================================
# this is only necessary if you haven't used tidyverse ever
# install.packages("tidyverse")

# load libraries
library(tidyverse)

##########################
## 3.2.4 Exercises

 # 1. Run ggplot(data = mpg). What do you see?

  
 # 2. How many rows are in mpg? How many columns?
  
 # 3. What does the drv variable describe? Read the help for ?mpg to find out.

 # 4. Make a scatterplot of hwy vs cyl.

 # 5. What happens if you make a scatterplot of class vs drv? Why is the plot not useful?

##########################
## 3.3.1 Exercises

 # 1. What’s gone wrong with this code? Why are the points not blue?

 ggplot(data = mpg) + 
   geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

 # 2. Which variables in mpg are categorical? 
 # Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). 
 # How can you see this information when you run mpg?
  
 # 3. Map a continuous variable to color, size, and shape. 
 # How do these aesthetics behave differently for categorical vs. continuous variables?
  
 # 4.What happens if you map the same variable to multiple aesthetics?
  
 # 5.What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)

 # 6. What happens if you map an aesthetic to something other than a variable name, 
 #     like aes(colour = displ < 5)? Note, you’ll also need to specify x and y.

##############################
## 3.5.1 Exercises

 # 1. What happens if you facet on a continuous variable?
  
 # 2.  What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they relate to this plot?
  
  ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

 # 3. What plots does the following code make? What does . do?
  
  ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

 # 4. Take the first faceted plot in this section:
  
  ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
  
 # 5. What are the advantages to using faceting instead of the colour aesthetic? 
   # What are the disadvantages? 
   # How might the balance change if you had a larger dataset?
  
 # 6. Read 
  ?facet_wrap
  
  #What does nrow do? 
  #What does ncol do? 
  #What other options control the layout of the individual panels? 
  #Why doesn’t facet_grid() have nrow and ncol arguments?
  
 # 7.When using facet_grid() you should usually put the variable with 
   #more unique levels in the columns. Why?
  
  
##############################
## 3.6.1 Exercises
  # 1. What geom would you use to draw a line chart? 
  # A boxplot? 
  # A histogram? 
  # An area chart?
    
 # 2. Run this code in your head and predict what the output will look like. 
  # Then, run the code in R and check your predictions.
  
  ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
    geom_point() + 
    geom_smooth(se = FALSE)
  
 # 3. What does show.legend = FALSE do? What happens if you remove it?
  # Why do you think I used it earlier in the chapter?
    
 # 4. What does the se argument to geom_smooth() do?
    
 # 5. Will these two graphs look different? Why/why not?
    
    ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_point() + 
    geom_smooth()
  
  ggplot() + 
    geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
  
  # 6. Recreate the R code necessary to generate the following graphs.
  

##############################
## 3.7.1 Exercises
  
  # 1. What is the default geom associated with stat_summary()? 
  # How could you rewrite the previous plot to use that geom function instead of the stat function?
    
  # 2. What does geom_col() do? How is it different to geom_bar()?
    
  # 3. Most geoms and stats come in pairs that are almost always used in concert. 
  # Read through the documentation and make a list of all the pairs. 
  # What do they have in common?
    
  # 4. What variables does stat_smooth() compute? 
  # What parameters control its behaviour?
    
  # 5. In our proportion bar chart, we need to set group = 1. Why? 
  
  # In other words what is the problem with these two graphs?
    
    ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, y = ..prop..))
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))
  
##############################
##3.8.1 Exercises
  # 1. What is the problem with this plot? How could you improve it?
    
    ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_point()
  
  # 2. What parameters to geom_jitter() control the amount of jittering?
    
  # 3.Compare and contrast geom_jitter() with geom_count().
  
  # 4. What’s the default position adjustment for geom_boxplot()? 
  # Create a visualisation of the mpg dataset that demonstrates it.

##############################
##3.9.1 Exercises
  # 1. Turn a stacked bar chart into a pie chart using coord_polar().
  
  # 2. What does labs() do? Read the documentation.
  
  # 3. What’s the difference between coord_quickmap() and coord_map()?
    
  # 4. What does the plot below tell you about the relationship between city and highway mpg? 
    # Why is coord_fixed() important? What does geom_abline() do?
    
    ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
    geom_point() + 
    geom_abline() +
    coord_fixed()