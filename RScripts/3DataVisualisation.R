#=====================================================================================================
# Script Name: 3DataVisualisation.R
# Script Author: Erika Anderson et al.
# Script Date: 2019-03
# R Version: R version 3.5.2 (2018-12-20) "Eggshell Igloo"
# RStudio: Version 1.1.463
#
# R for Data Science Exercises 
# section 3 Data Visualisation
# see answers at https://rpubs.com/phi/271994
#
#=====================================================================================================
# this is only necessary if you haven't used tidyverse ever
# install.packages("tidyverse")

# load libraries
library(tidyverse)

##########################
## 3.2.4 Exercises

 # 1. Run 
      ggplot(data = mpg)

      # What do you see? 
      # - Empty plot

 # 2. How many rows are in mpg? - 234 
      # How many columns? - 11
      mpg
      
 # 3. What does the drv variable describe? Read the help for ?mpg to find out.
      ?mpg
      
      # drive train: f = front-wheel drive, r = rear wheel drive, 4 = 4wd

 # 4. Make a scatterplot of hwy vs cyl.
      
      ggplot(data = mpg) +
        geom_point(aes(x = hwy, y = cyl))

 # 5. What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
      
      ggplot(data = mpg) +
        geom_point(aes(x = class, y = drv))
      
      # - categorical variables so need different plot type

##########################
## 3.3.1 Exercises

 # 1. What’s gone wrong with this code? Why are the points not blue?
 ggplot(data = mpg) + 
   geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
      # - within aes brackets

 # 2. Which variables in mpg are categorical?
 # Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). 
 # How can you see this information when you run mpg?
      str(mpg)
      head(mpg)
      # categorical: manufactuer, model, cyl, trans, drv, fl, class
      # continuous: displ, year, cty, hwy
      
  
 # 3. Map a continuous variable to color, size, and shape. 
 # How do these aesthetics behave differently for categorical vs. continuous variables?
      
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy, color = displ, size = hwy))
      
      # a continuous variable cannot be mapped to shape
      # a categorical variable is discrete whereas a continuous variable is range
  
 # 4. What happens if you map the same variable to multiple aesthetics?
      
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy, color = displ, size = displ))
      
      # it maps to both with two legends
  
 # 5.What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)
      
      ?geom_point
      
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy), shape = 21)
      
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy, stroke = displ), shape = 21)
      
      # modifies the width of the border of hollow shapes (21-25)
      

 # 6. What happens if you map an aesthetic to something other than a variable name, 
 #     like aes(colour = displ < 5)? Note, you’ll also need to specify x and y.
      
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))
      
      # uses equation to color plot

##############################
## 3.5.1 Exercises

 # 1. What happens if you facet on a continuous variable?
      
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy)) + 
        facet_wrap(~ displ)
      # plots each instance as plot
  
 # 2.  What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they relate to this plot?
  
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy)) + 
        facet_grid(drv ~ cyl)
      
      ggplot(data = mpg) + 
          geom_point(mapping = aes(x = drv, y = cyl))
      
      # combinations of drive types and cylinders that were not sampled

 # 3. What plots does the following code make? What does . do?
  
  ggplot(data = mpg) + 
     geom_point(mapping = aes(x = displ, y = hwy)) +
     facet_grid(drv ~ .)

    ggplot(data = mpg) + 
       geom_point(mapping = aes(x = displ, y = hwy)) +
       facet_grid(. ~ cyl)

  # the dot is a place holder so the plots will display in a grid with only one categorical variable

 # 4. Take the first faceted plot in this section:
  
  ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
  
   # What are the advantages to using faceting instead of the colour aesthetic? 
      # You can see each class type graphed individually
   # What are the disadvantages? 
      # harder to compare between class types compared to colour aesthetic
   # How might the balance change if you had a larger dataset?
      # more points in each graph so grid better than colour, unless you summarize data
      # answer says that larger dataset means overall clustering is more important
  
 # 6. Read 
  ?facet_wrap
  
  #What does nrow do?  - number of rows
  #What does ncol do?  - number of columns
  #What other options control the layout of the individual panels? 
    # scales = "free" allows the axes to vary between grids
    # shrink = changes scales to output of stats, not data
   
  #Why doesn’t facet_grid() have nrow and ncol arguments?
    # number is determined by the data
  
 # 7.When using facet_grid() you should usually put the variable with 
   # more unique levels in the columns. Why?
  
  # the y-axis shrinks so it is harder to see which actual values are at the points

##############################
## 3.6.1 Exercises
  # 1. What geom would you use to draw a line chart? 
        # geom_line
  # A boxplot?
        # geom_boxplot
  # A histogram? 
        # geom_histogram
  # An area chart?
        # geom_area
    
 # 2. Run this code in your head and predict what the output will look like. 
  # Then, run the code in R and check your predictions.
  
  ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
    geom_point() + 
    geom_smooth(se = FALSE)
  
 # 3. What does show.legend = FALSE do? What happens if you remove it?
  # Why do you think I used it earlier in the chapter?
  
    # removes the legend for simplicity; never used in chapter since geom_smooth omits legend anyway
    
 # 4. What does the se argument to geom_smooth() do?
    # adds confident interval around the line (default is 95%)
    
 # 5. Will these two graphs look different? Why/why not?
    
    ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_point() + 
    geom_smooth()
  
  ggplot() + 
    geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
  
  # No - just reducing replication by putting aes in ggplot function
  
  # 6. Recreate the R code necessary to generate the following graphs
  
  ggplot(mpg, aes(displ, hwy)) +
    geom_point(size = 5) +
    geom_smooth(se = FALSE)
  
  ggplot(mpg, aes(displ, hwy)) +
    geom_point(size = 5) +
    geom_smooth(aes(group = drv), se = FALSE)
  
  ggplot(mpg, aes(displ, hwy, color = drv)) +
    geom_point(size = 5) +
    geom_smooth(aes(), se = FALSE)
  
  ggplot(mpg, aes(displ, hwy)) +
    geom_point(aes(color = drv), size = 5) +
    geom_smooth( se = FALSE)
  
  ggplot(mpg, aes(displ, hwy)) +
    geom_point(aes(color = drv), size = 5) +
    geom_smooth(aes(linetype = drv), se = FALSE)
  
  ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_point(mapping = aes(color=drv)) + 
    geom_point(shape = 21, color = "white", stroke = 5)
  
  
##############################
## 3.7.1 Exercises
  
  # 1. What is the default geom associated with stat_summary()? 
    # stat_count()
  # How could you rewrite the previous plot to use that geom function instead of the stat function?
  
  ggplot(data = diamonds) + 
    geom_bar(aes(cut))
    
  # 2. What does geom_col() do? How is it different to geom_bar()?
  
    #geom_bar() makes the height of the bar proportional to the number of cases in each group
  # (or if the weight aesthetic is supplied, the sum of the weights). If you want the heights of 
  # the bars to represent values in the data, use geom_col() instead.
    
  # 3. Most geoms and stats come in pairs that are almost always used in concert. 
  # Read through the documentation and make a list of all the pairs. 
  # What do they have in common?
  
    # geom_bar stat_count
    # geom_histogram stat_bin
    # geom_abline 
    # geom_smooth stat_smooth
    
  # 4. What variables does stat_smooth() compute? 
  
      # usually smoothed means
  
  # What parameters control its behaviour?
      
    # mapping (or aes), data, poistion, color, size, linetype, method, formula,
    # se, na.rm, show.legend, inherit.aes, geom, stat, n, span, fullrange, level, method.args

  # 5. In our proportion bar chart, we need to set group = 1. Why? 
  
  # In other words what is the problem with these two graphs?
    
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, y = ..prop..))
    
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))
  
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, y = ..prop..,   group = 1))
  
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = color, y = ..prop.., group = 1)) 
  # we lose color since it is one group now
  
  ?geom_bar
  ??"ggplot2-specs"
  
##############################
##3.8.1 Exercises
  # 1. What is the problem with this plot? How could you improve it?
    
    ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_point()
  
  # overplotting??
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_jitter()
  
  # 2. What parameters to geom_jitter() control the amount of jittering?
  
  ?geom_jitter
  # geom_jitter(width = ?, height = ?)
  
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_jitter(width = 0.5, height = 0.5)
    
  # 3.Compare and contrast geom_jitter() with geom_count().
  
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_count()
  
  # geom_count makes the size of the point proportional to the number
  # geom_jitter moves the points randomly to show more overlapping points
  
  # 4. What’s the default position adjustment for geom_boxplot()? 
  
  ?geom_boxplot
  
  # position = "dodge2"
  # Dodging preserves the vertical position of an geom while adjusting the horizontal position.
  # position_dodge2 is a special case of position_dodge for arranging box plots, 
  # which can have variable widths
  
  # Create a visualisation of the mpg dataset that demonstrates it.
  
  ggplot(data = mpg, aes(drv, cty)) +
    geom_boxplot()

##############################
##3.9.1 Exercises
  # 1. Turn a stacked bar chart into a pie chart using coord_polar().
  
 p <-  ggplot(mpg, aes(drv)) +
    geom_bar(aes(fill = trans))
  
  p + coord_polar()
  
  # 2. What does labs() do? Read the documentation.
  
  ?labs
  # used to label plot title, caption, axes...
  
  # 3. What’s the difference between coord_quickmap() and coord_map()?
  
  ?coord_map
  # projects a portion of the earth, which is approximately spherical, onto a flat 2D plane
  
  ?coord_quickmap
  # type of coord_map that is quick approximation that does preserve straight lines
  # works best for smaller areas closer to the equator.
    
  # 4. What does the plot below tell you about the relationship between city and highway mpg? 
  
  # the number of cylinders increases the miles per gallon
  
    # Why is coord_fixed() important? What does geom_abline() do?
    
    ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
    geom_point() + 
    geom_abline() + # fits a line diagonal line to the data based on slope and intercept
    coord_fixed() # forces ratio of y units to x units