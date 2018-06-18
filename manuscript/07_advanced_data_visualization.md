# Advanced Data Visualization

So far in this course we've discussed the characteristics of good plots and tables as well as how to generate these using the statistical programming language R. The remainder of this course will build on what you have already learned, exposing you to a few additional tools that are to you for data visualization. The rest of this course is meant to expose you to the possibilities in R, not help you become an expert. However, after having an idea of the possibilities, we will provide links to other places where you can obtain more information, allow you to practice your data visualization skills on your own, and eventually become an expert at advanced data visualization.

### Interactive Graphics

Up to this point, all the graphics we've generated have been static graphics. Static graphics can certainly convey a lot of important information about data. However, they don't react to user input. Nothing changes when you scroll over them. And, there is no way to adjust what is seen in the graphic after the static graphic is generate. On the other hand, interactive graphics allow users to interact with the information displayed. These graphics add an additional layer of information to the graphics we've previously generated in R. For example, an interactive graphic may allow the user to scroll over points on the plot and display information about that point. Or, it may allow the user to highlight a portion of the graph and zoom in on that part of the graph. Generally, if a graph changes in response to user input, it is an interactive graphic.

### Animated Graphics

Animated graphics are similar to interactive graphics in that they are not static. However, unlike interactive graphics -- which respond to user input -- animated graphics can generally be thought of as a number of static plots displayed one after another in a specific order in an animation. These are helpful when trying to display changes over time. 

### Advanced Graphics In R

Both interactive and animated graphics can be generated in R. We'll cover the basics below and will include additional resources that can be used to learn even more about generating these types of graphics in R.

#### plotly

plotly can be used to "easily translate `ggplot2` graphs to an interactive web-based version and/or create custom web-based visualizations directly from R." 

##### plotly interactive graphics

Below, you see that `p` is a ggplot object. Here, we're using a dataset with data from 150 different iris flowers. We're looking at the petal length and petal width of these flowers, broken down by the species of the flower in the plot below. To take this static plot from `ggplot` (which we learned to generate earlier in this course),  to an interactive plot, it only requires calling `ggplotly()`.

```r
## Load libraries
library(ggplot2)
library(plotly)

## generate ggplot2 object
p <- ggplot(iris, aes(x = factor(Species), y = Petal.Length, color = Petal.Width)) +
  geom_boxplot() +
  geom_point()

## generate intreactive graphic
p <- ggplotly(p)
p
```

Within RStudio, ggplotly() graphs will display within the 'Viewer' tab. 

![iris interactive plot in RStudios](images/07_advanced_data_visualization/07_dataviz_advanced_data_visualization-2.png)

While this picture here appears to be static, within RStudio, you are able to interact with this graph. For example, if you hover over a point on the graph, information about that particular point will display.  

![information about a specific point](images/07_advanced_data_visualization/07_dataviz_advanced_data_visualization-3.png)

Similarly, if you hover your mouse over the boxplot, summary information about that category will display.

![information about a specific group of points](images/07_advanced_data_visualization/07_dataviz_advanced_data_visualization-4.png)


If you hover over the graph in general, options will display at the top right of the interactive graph. 
![hover over plot menu displays](images/07_advanced_data_visualization/07_dataviz_advanced_data_visualization-5.png)

We won't walk through each of these now, but if you hover your mouse over any of the icons in the menu, it will describe what that button does. The best way to get a feel for what these do is to play around with these options in RStudio and to read the [plotly documentation](https://plotly-book.cpsievert.me/)

![hover over button in menu displays](images/07_advanced_data_visualization/07_dataviz_advanced_data_visualization-6.png)



##### plotly animated graphics
 
In addition to general interactive graphics, plotly can also be used to generate animated plots - plots that show changes over time. The code for this is similar in form to what is seen above; however, it requires the `frame` argument be specified. This states what variable `ggplotly` should use for each frame in the animation. 

To demonstrate how this can be done, we'll use a very common example data set, frequently used by R users. This dataset is from Jenny Bryan's [`gapminder` R package](https://cran.r-project.org/web/packages/gapminder/index.html). It contains data about the life expectancy, population, and per capita GDP from a number of countries from 1952 to 2007. We will use these data to generate an animated graphic that shows the relationship between per capita GDP and life expectancy by country. Each point on the graph represents a different country. The points are colored by the continent that each country is from. As mentioned above, to generate an animated plot within plotly, frame must be specified. Below, frame is specified to be `year,` which specifies that the animation should cycle through the years within this dataset.

```r
## install the package 
install.packages("gapminder")

## get the data
data(gapminder, package = "gapminder")

## generate ggplot object
gg <- ggplot(gapminder, aes(gdpPercap, lifeExp, color = continent)) +
  geom_point(aes(frame = year, ids = country)) +
  scale_x_log10()

## plot animated graphic
ggplotly(gg)

```

![plotly animated graphic](images/07_advanced_data_visualization/07_dataviz_advanced_data_visualization-8.png)

An important point is that this animated graphic is still an interactive graphic. For example, if we were only interested in looking at this relationship for countries in Africa and Europe, we could click on "Americas", "Asia", and "Oceania" in the legend to remove those points from the plot in the current view. 

![plotly animated graphic is still interactive](images/07_advanced_data_visualization/07_dataviz_advanced_data_visualization-9.png)

##### plotly in RMarkdown reports

plotly objects can be printed directly into RMarkdown reports (.Rmd files) as long as that .Rmd file is knit into an HTML document. If, however, a plotly object is knit in a non-HTML format, it will print simply as a .png screenshot of the graph.


#### gganimate

With many things in R, there is more than one way to generate animated objects in RStudio. There is an additional package that allows for the generation of animated graphics from ggplot2 graphs: [`gganimate`](https://github.com/dgrtwo/gganimate).

Below we will generate the same graph as above but will use `gganimate()` to do so. The code to generate the ggplot object created (gg) will not change. The benefit of gganimate() is that if you are interesting in saving the image as a GIF, rather than embedding the plot into your .Rmd report, gganimate() has this capability. (gganimate() can save animated graphics as .gif, .mp4, .swf, and .html objects)

```r
## download and load gganimate 
devtools::install_github("dgrtwo/gganimate")
library(gganimate)

## plot animated graphic using gganimate
gganimate(gg)

## to save this plot
gganimate(gg, "output.gif")

```

![gganimiate gif](images/07_advanced_data_visualization/output.gif)


### Additional resources
* [plotly](https://plotly-book.cpsievert.me/) documentation
* [gganimate](https://github.com/dgrtwo/gganimate) documentation

### Slides and Video
  
![Advanced Data Visualization](UPDATE LINK)
  
  * [Slides](https://docs.google.com/presentation/d/1akxwxd52on22B7uUhZTUi1oHJ6PSDicdVchjmVynhr0/edit?usp=sharing)
  
  
{quiz, id: quiz_07_advanced_data_visualization}
  
### Advanced Data Visualization
  
? What type of visualization allows the user to make changes to the plot by clicking on it?
  
A) interactive
b) explanatory
c) animated
d) static
e) exploratory

? Which of these can be used to generate interactive plots in RStudio?

a) iris
b) ggplot2
C) plotly
d) ggplot

? To output a .gif animated plot, which package would you use? 

a) ggplot
B) gganimate
c) plotly
d) ggplot2

? If you knit a .Rmd file into an HTML report, how will a plot from plotly() display?

a) as a static png
B) as an interactive plot
c) it won't display
d) incorrectly formatted

{/quiz}



