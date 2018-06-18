# From Exploratory to Explanatory

In the last lesson, we covered what to consider when making a plot and the basics of using `ggplot2` for generating plots in R. While you now know how to make basic R plots using `ggplot2`, here we will cover exactly *how* to customize your plots within the `ggplot2` framework. The details we discuss here will take a quick exploratory plot to a final explanatory plot.

### Apple Product Sales Data

To discuss going from exploratory plots, such as the four plots made last lesson reviewing common geoms used in ggplot2, to explanatory plots, such as the iPhone plot we recreated from [Lisa Charlotte Rost's](https://twitter.com/lisacrost) [blog post](https://blog.datawrapper.de/better-charts/), we'll begin with the fact that `ggplot2` is incredibly flexible. This means that if you can think of a change you want to make to your plot, there is almost always a way to make it happen in `ggplot2.`

To discuss the types of changes you can make to plots, we'll return to the iPhone sales plot we looked at last lesson and use that as an example. We'll examine the code used to make that plot to highlight the types of changes you can make to the the overall appearance of a plot.  

![Final reproduction of blog post plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-1.png)

Before we do that, let's take a glance at the data used to make this plot. 

![data for iPhone plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-2.png)

The variables used to reporduce the blog post graph are:
  * **yrq** - a variable for the year and quarter from which the sales of the Apple product was recorded
* **variable** - which Apple Product we're talking about (iPhone, iPad, or iPod)
* **value** - the sales for that Apple product in that year and quarter in millions of US dollars. NA means no data were available for that product in that year-quarter.

While there is a lot of code that led to this final product of this plot, you'll note that it still starts with the same basic framework we already discussed. There is a ggplot() call and then the geom is defined. Here, as we wanted a line for each Apple product, we specify the geom `geom_line().` While the framework is similar to what we discussed, there is the addition of the `group` argument and the `color` argument. `group` specifies that there should be three lines, one for each Apple product. `color` specifies that we want each line to be a different color. 

![plot code highlighting first two lines](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-3.png)

In fact, if we were to just run these two lines of code, we would have a reasonable exploratory plot.  

```r
ggplot(data = df2, aes(x=yrq, y=value, group=variable, color=variable)) +
  geom_line() 
```

![Exploratory plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-4.png)

While this plot is not nearly as clear nor as pretty as the final plot, you can better understand the data at this point, which is precisely the goal of an exploratory plot.

##### Adding a title

However, as you improve the clarity of your plot, you'll want to consider including a great title. As discussed at the beginning of this lesson, it's important to add a title that tells viewers what conclusions that should draw from the plot. `ggtitle()` allows the addition of both a title and a subtitle to any plot made with `ggplot2.` 

![ggtitle adds title to plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-5.png)

##### Altering text size

In the exploratory plot above, while the lines are clear, the text along the axis is pretty small. As you work toward a final explanatory plot, you'll often have to adjust the text size of your axis and title. In `ggplot2`, text size is controlled within `theme()`. 

![code to control text size](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-6.png)

You'll note that the format of the code to control text size within `theme()` always first specifies what part of the plot you want to want to change, followed by an equals sign (=), then `element_text()` with `size=` specified within `element_text()`. Larger values result in larger text and smaller values smaller text. 

```r
theme (
  part.of.plot.you.want.to.control = element_text(size=#)
)
```

#### Altering line color 

You may have noticed that the default colors within ggplot2 (as seen in the exploratory plot above) are red, green, and blue for these plots. However, in our final version, we highlight the iPhone line in red and have the iPad and iPod lines in grey. This is controlled using `scale_colour_manual()`. `scale_colour_manual()` knows which variable lines should be colored because `color=variable` was defined earlier. If `color=variable` had not been included in that first line, scale_colour_manual() would not know what to color. For example, R will let you know in your console if you try this that it doesn't "know how to automatically pick scale for object of type yearqtr" and the resulting plot will simply have three black lines.   

![Trying to defince colors without telling R what variable to color](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-7.png)

However, when `color=variable` is included, then within `scale_colour_manual()`, the values (or colors) you want to plot can be specified, with a single color stated for each line in the plot. In R, colors can be specified by color name. All the possible color names can be referenced using [this reference sheet](http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf). Note that the order of these colors matters. The first one refers to the first level in your factor. As discussed in an earlier course, the levels of a factor can be determined using `levels()`. iPhone is the first level in our variable of interest, and thus, "red3" is the first color specified. The second two colors are both "grey," corresponding to "iPad" and then "iPod," the second and third levels in our variable of interest. 

![Changing line color in plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-8.png)

#### Altering line color and thickness

Now that the lines are the color we want, we often want the lines to be thicker and more visible. This is controlled in `geom_line()` by stating the size. Here, we've specified `geom_line(size=1.5)`.  Larger values lead to thicker lines.

![Changing line thickness in plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-9.png)

#### Annotating the plot

Once a plot is almost complete, to really make it as explanatory as possible, you'll often want to annotate the plot to draw viewers attention to a particular point on the plot. To do so in `ggplot2`, there is `annotate()`. For this plot, `annotate()` was used both to add the grey rectangle and to add the text to the plot explaining that in 2010 was the first year when more iPhones were sold than iPods. 
![adding annotation in ggplot2](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-10.png)

Within annotate, you have to specify the geom you want to add to the plot (here we add "rect" and "text") and the x- and y-coordinates on the graph where you want the annotation to appear. Additionally, you also have the ability to control a number of parameters, including:
* alpha - the transparency of shapes on the plot
* size - the size of the text
* hjust - the horizontal alignment of text (vjust controls vertical alignment)

#### Final changes to the plot

When you are making an exploratory plot, there is a lot of fine-tuning that happens. You'll play around with the size of your text and colors until they're perfect and make sure your title says exactly what you want your viewer to see. In this plot, the fine tuning that happened included:

* specifying what values would be displayed on the axes (using `scale_x_yearqrter` from the `zoo` package and `scale_y_continuous`)
* removing vertical grid lines (within `theme()` controling `panel.grid.major.x` and `panel.grid.minor.x`).
* changing the default ggplot2 theme to `theme_bw` (which removes the default grey background)
* Removing variable names from the axes (controlling `axis.title.x` and `axis.title.y` within `theme`)
* Controling how much space there is around the plot (using `plot.margin` within `theme`)
* using library(directlabels) to add text labels to each line (`geom_dl`)
* expanding the space along the axes so there was room for each direct label (using `expand`)
* removing the legend (within `theme` using `legend.position`)
* removing the border from around the plot (within `theme` using `panel.border`)

![unannotated code for plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-10.png)

We point these out now not so you master each of these alterations, but rather so that you have some idea of what it takes to make an exploratory plot that you make very quickly for your own purposes into an explanatory plot that clearly communicates your results to someone else. 

As you practice making plots in R, know that it's typical to struggle to figure out how to make the plot look exactly the way you want. Google will help here and so will people on [stack overflow](https://stackoverflow.com/). Googling your specific question and looking for solutions in R that other people have already come up with is a great place to start whenever you're stuck trying to figure out something on a plot. Also, really great explanatory plots take time. It's ok to spend a lot of time making a single important plot that effectively communicates your point.  

### Slides and Video
  
![Making Plots In R](UPDATE LINK)
  
  * [Slides](https://docs.google.com/presentation/d/1HZFgSe0m8_Ehwvd674AkdpOnnGiir5oluvIi68C_icI/edit?usp=sharing)
  
  
{quiz, id: quiz_05_exploratory_to_explanatory}
  
### From Exploratory to Explanatory
  
{choose-answers: 4}
? What is the goal of the title on your plot?
  
C) tell viewers what they will see on the plot
o) Define what variables are on your axes
o) choose the appropriate colors 
o) ggplot2 won't make a plot without one
o) explain all the data on the plot in detail
o) tell ggplot2 what shapes to put on the plot

{choose-answers: 4}
? To finalize your plot you may want to add text onto your plot. What should you use?

C) annotate("text")
o) annotate("rect")
o) axis.text
o) element_text()
o) add_text("text")
o) add.text("text")

{choose-answers: 4}
? To increase or decrease the thickness of a line on a plot, where do you specify its size?

C) geom_line()
o) theme()
o) geom_dl()
o) annotate()
o) line_thickness()
o) line_size
o) line(size=3)
o) lwd()

{choose-answers: 4}
? In the final plot generated, what piece of information discussed as necessary is missing from this plot?

C) information about the data source
C) axis labels
o) any data
o) an informative title
o) labels for each line
o) values on the axes
o) annotation
o) data labels

{choose-answers: 4}
? To add a caption to a plot, what would you use? (Note: this isn't discussed in this lecture. It may require Googling for the answer.)

C) labs(caption = "")
o) ggcaption("")
o) geom_caption("")
o) ggplot(caption = "")
o) ggplot2(caption = "")
o) labels(caption = ""

{/quiz}