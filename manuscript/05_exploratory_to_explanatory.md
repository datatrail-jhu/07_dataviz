# From Exploratory to Explanatory

In the lessons in this course up to this point, we have covered what to consider when making a plot, the basics of using `ggplot2` to generate plots in R, how to customize `ggplot2` plots, and how to save figures. In this lesson we're going to put all of those skills together and walk through an example of how to take a plot from exploratory (its roughest form) to explanatory (polished and ready to be presented).

### Apple Product Sales Data

To discuss going from exploratory plots, such as the four plots made last lesson reviewing common geoms used in `ggplot2`, to explanatory plots, such as the iPhone plot we recreated from [Lisa Charlotte Rost's](https://twitter.com/lisacrost) [blog post](https://blog.datawrapper.de/better-charts/), we'll leverage the fact that `ggplot2` is incredibly flexible and allows for layering. This means that if you can think of a change you want to make to your plot, there is almost always a way to make it happen in `ggplot2.`

To discuss the types of changes you can make to plots, we'll return to the iPhone sales plot we looked at in an earlier lesson in this course where we discussed considerations that should be made when making good plots and use that as an example. We'll walk through the code used to make that plot and highlight the types of changes you can make to the the overall appearance of a plot step-by-step.  

![Final reproduction of blog post plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-1.png)

Before we do that, let's take a glance at the data used to make this plot. 

![data for iPhone plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-2.png)

The variables used to reproduce the blog post graph are:

* __yrq__ - a variable for the year and quarter from which the sales of the Apple product was recorded
* __variable__ - which Apple Product we're talking about (iPhone, iPad, or iPod)
* __value__ - the sales for that Apple product in that year and quarter in millions of US dollars. NA means no data were available for that product in that year-quarter.


### Exploratory Plot 

While there is a lot of code that led to this final product of this plot, you'll note that it still starts with the same basic framework we already discussed. There is a ggplot() call and then the geom is defined. Here, as we wanted a line for each Apple product, so we specify the geom `geom_line().` This isn't a geom we have discussed explicitly yet, but it connects the points on a plot with a single line. It's helpful for plotting data over time, which is exactly what we're doing here! In addition to specifying the x and y arguments within `aes()`, we are also specifying the `group` and `color` arguments, both of which we have discussed previously. Here, `group` lets `ggplot2` to map the variable `variable` to three different lines (one for each Apple product) and `color` specifies that we want to map the variable `variable` to three different colors.

![plot code highlighting first two lines](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-3.png)

In fact, if we were to just run these two lines of code, we would have a reasonable exploratory plot.  

```r
ggplot(data = df2, aes(x = yrq, y = value, group = variable, color = variable)) +
  geom_line() 
```

![Exploratory plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-4.png)

While this plot is not nearly as clear nor as pretty as the final plot, you can better understand the data at this point, which is precisely the goal of an exploratory plot.

You may notice that in this code `aes` is including within the `ggplot()` function rather than within `geom_line()`. We *could* have put `aes` within `geom_line()` as we've done previously; however, when `aes()` is included in `ggplot()`, its arguments are used throughout each subsequent function that is called. As we aren't going to be changing the x, y, group, or color variable in subsequent function calls, there is no harm in including these arguments within `ggplot()` rather than `geom_line`. Feel free to play around with `aes` to see if anything changes if you move it to `geom_line()`!


### Increasing Line Thickness

The lines on this plot are a little too thin to be seen easily and certainly not as thick as the lines on the original plot. So, let's use the `size` argument within `geom_line` to make these lines thicker and more visible.

```r
ggplot(data = df2, aes(x = yrq, y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) 
```

![`size` increases line thickness](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-5.png)

### Adding a Title

Before we go any further, we'll want to consider including a great title. As discussed at the beginning of this lesson, it's important to add a title that tells viewers what conclusions that should draw from the plot. `ggtitle()` allows the addition of both a title and a subtitle to any plot made with `ggplot2.` 

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014")
```

![ggtitle adds title to plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-6.png)

Here, we're using the same title and subtitle as was used in the plot originally.

### Changing Line Colors

Here, since we've specified a variable to color in our `aes()` originally, we're able to manually control what the colors of this color variable are. We do that within the function `scale_colour_manual()` by specifying the three colors for our three lines using the `values` argument.

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  scale_colour_manual(values = c("red3","grey","grey")) 
```

![`scale_colour_manual` allows for manual control of the line colors](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-7.png)

### Specifying a Theme

Before we go any further, let's just remove that gray background. To do so, we'll use the very helpful black and white theme: `theme_bw()`

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  scale_colour_manual(values = c("red3","grey","grey")) + 
  theme_bw()
```

![`theme_bw()` gets us closer to the aesthetic we're looking for](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-9.png)

### Customizing the Theme

After getting closer to the look we want, we can modify the theme specifically using `theme()`. To get us started we'll first remove the vertical gridlines. Note that within theme, when you want to remove a theme element you specify that by setting the theme element to `element_blank()`.

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  scale_colour_manual(values = c("red3","grey","grey")) + 
  theme_bw() +
  theme(  panel.grid.major.x = element_blank() ,
          panel.grid.minor.x = element_blank()
  )
```

![removing vertical grid lines](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-9.png)

We can then remove the axis labels `yrq` and `value` from the plot. The necessary information about what is plotted on each axis is included in the subtitle already on this plot

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  scale_colour_manual(values = c("red3","grey","grey")) + 
  theme_bw() +
  theme(  panel.grid.major.x = element_blank() ,
          panel.grid.minor.x = element_blank() ,
          axis.title.x = element_blank(),
          axis.title.y = element_blank()
   ) 
```

![removing axis labels](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-10.png)

Now, let's increase the size of those axis labels and the plot title, so that they're clear to anyone looking at this plot!

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  scale_colour_manual(values = c("red3","grey","grey")) + 
  theme_bw() +
  theme(  panel.grid.major.x = element_blank() ,
          panel.grid.minor.x = element_blank() ,
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text = element_text(size=15),
          plot.title = element_text(size = 22),
          plot.subtitle = element_text(size = 15)
  )
```

![increase font size across plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-11.png)

Now, let's just make a few more tweaks. Let's first remove the legend because we're going to directly label the lines in a few steps and let's remove the unnecessary border around the plot.

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  scale_colour_manual(values = c("red3","grey","grey")) + 
  theme_bw() +
  theme(  panel.grid.major.x = element_blank() ,
          panel.grid.minor.x = element_blank() ,
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text = element_text(size=15),
          plot.title = element_text(size = 22),
          plot.subtitle = element_text(size = 15),
          legend.position ="none",
          panel.border = element_blank()          
  )
```

![Removing the legend and border around the plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-12.png)

Now that the border has been removed, we're kind of squished up right against the edge of the plotting area. We can increase the area around the plot by specifying `plot.margin`. The default for this argument is `plot.margin = unit(c(1, 1, 0.5, 0.5), "lines")` where the four numbers correspond to the top, right, bottom, and left of the plot. Here, by increasing the value from 0.5 to 1 we're increasing the space in the margin area beneath and to the left of the plot a bit.

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  scale_colour_manual(values = c("red3","grey","grey")) + 
  theme_bw() +
  theme(  panel.grid.major.x = element_blank() ,
          panel.grid.minor.x = element_blank() ,
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text = element_text(size=15),
          plot.title = element_text(size = 22),
          plot.subtitle = element_text(size = 15),
          legend.position ="none",
          panel.border = element_blank(),
          plot.margin = unit(c(1,1,1,1), "lines"),
          
  ) 
```

![Adjusting plot margin](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-13.png)

### Customizing Axis Labels

Now that we've got the theme pretty close to what we want and have increased the size of the font on the axes, it's clear that they're not quite displaying enough information. We can specify how and what values are displayed on the x and y axis so that each year is displayed along the x-axis and multiples of ten along the y-axis. 

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  scale_colour_manual(values = c("red3","grey","grey")) + 
  theme_bw() +
  theme(  panel.grid.major.x = element_blank() ,
          panel.grid.minor.x = element_blank() ,
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text = element_text(size=15),
          plot.title = element_text(size = 22),
          plot.subtitle = element_text(size = 15),
          legend.position ="none",
          panel.border = element_blank(),
          plot.margin = unit(c(1,1,1,1), "lines"),
          
  ) +
  scale_x_yearqtr(limits = c(2004, 2015),
                  format = "%Y", breaks=c(2004:2015), expand = c(0.1, 0.01)) + 
  scale_y_continuous(breaks = c(0,10,20,30,40,50,60,70,80))
```

![controlling axis labels](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-14.png)

### Adding direct labels

There isn't direct functionality to directly label lines in `ggplot2`, but someone has written a package called `directlabels` to do just that for plots generated in `ggplot2`. Here we add an additional geom, `geom_dl` to label our lines directly.

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  scale_colour_manual(values = c("red3","grey","grey")) + 
  theme_bw() +
  theme(  panel.grid.major.x = element_blank() ,
          panel.grid.minor.x = element_blank() ,
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text = element_text(size=15),
          plot.title = element_text(size = 22),
          plot.subtitle = element_text(size = 15),
          legend.position ="none",
          panel.border = element_blank(),
          plot.margin = unit(c(1,1,1,1), "lines"),
          
  ) +
  scale_x_yearqtr(limits = c(2004, 2015),
                  format = "%Y", breaks=c(2004:2015), expand = c(0.1, 0.01)) + 
  scale_y_continuous(breaks = c(0,10,20,30,40,50,60,70,80)) + 
  geom_dl(aes(label = variable), 
          method = list(c("last.points"),
                        aes(colour = "black"), 
                        cex = 1.3)
  )
```

![`geom_dl` directly labels our three lines](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-15.png)

#### Adding Annotations

The plot is really close to complete at this point. But, to really make it as explanatory as possible, we want to annotate the plot to draw viewers attention to a particular point on the plot. To do so in `ggplot2`, we'll use `annotate()`. 

Here, we'll use `annotate()` to both to add the grey rectangle and to add the text to the plot explaining that in 2010 was the first year when more iPhones were sold than iPods. 

First, we specify we want to generate a "rect" using annotate and include the limits of that rectangle. 

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  scale_colour_manual(values = c("red3","grey","grey")) + 
  theme_bw() +
  theme(  panel.grid.major.x = element_blank() ,
          panel.grid.minor.x = element_blank() ,
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text = element_text(size=15),
          plot.title = element_text(size = 22),
          plot.subtitle = element_text(size = 15),
          legend.position ="none",
          panel.border = element_blank(),
          plot.margin = unit(c(1,1,1,1), "lines"),
          
  ) +
  scale_x_yearqtr(limits = c(2004, 2015),
                  format = "%Y", breaks=c(2004:2015), expand = c(0.1, 0.01)) + 
  scale_y_continuous(breaks = c(0,10,20,30,40,50,60,70,80)) + 
  geom_dl(aes(label = variable), 
          method = list(c("last.points"),
                        aes(colour = "black"), 
                        cex = 1.3)
  ) +
  annotate("rect", xmin = 2010, xmax = 2011, ymin = 0, ymax = Inf, fill = "grey", alpha = 0.2)
```

![adding the rectangle to draw attention](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-16.png)

Within annotate, we to specify the geom you want to add to the plot (here we add "rect" and "text") and the x- and y-coordinates on the graph where you want the annotation to appear. Additionally, you also have the ability to control a number of parameters, including:

* alpha - the transparency of shapes on the plot
* size - the size of the text
* hjust - the horizontal alignment of text (vjust controls vertical alignment)

Finally, we can again use `annotate()` to add text directly to the plot to explain what that gray box is highlighting. Here, we specify that this annotation is "text" (rather than "rect") and include information about where we want that annotation to appear on the plot (`x` and `y`), what we want it to say (`label`), how we want it to be aligned (`hjust`), and how big it should be (`size`).

```r
ggplot(data = df2, aes(x = yrq,y = value, group = variable, color = variable)) +
  geom_line(size = 1.5) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  scale_colour_manual(values = c("red3","grey","grey")) + 
  theme_bw() +
  theme(  panel.grid.major.x = element_blank() ,
          panel.grid.minor.x = element_blank() ,
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text = element_text(size=15),
          plot.title = element_text(size = 22),
          plot.subtitle = element_text(size = 15),
          legend.position ="none",
          panel.border = element_blank(),
          plot.margin = unit(c(1,1,1,1), "lines"),
          
  ) +
  scale_x_yearqtr(limits = c(2004, 2015),
                  format = "%Y", breaks=c(2004:2015), expand = c(0.1, 0.01)) + 
  scale_y_continuous(breaks = c(0,10,20,30,40,50,60,70,80)) + 
  geom_dl(aes(label = variable), 
          method = list(c("last.points"),
                        aes(colour = "black"), 
                        cex = 1.3)
  ) +
  annotate("rect", xmin = 2010, xmax = 2011, ymin = 0, ymax = Inf, fill = "grey", alpha = 0.2) +
  annotate("text", x = 2010.5, y = 40, label = "After Apple announced \n the iPhone 4 in 2010, \n more iPhones were sold \n than iPods for the first time.", hjust = 1, size=6)
```

![adding text to plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-18.png)

### Explanatory Plot

With all of these changes, you now have a beautiful plot that accomplishes everything an explanatory plot should. It conveys information clearly to the viewer, is well-labeled, and draws the attention of the viewer to the important parts of the graph.

![Explanatory Plot](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-19.png)

We point these out now not so you master each of these alterations, but rather so that you have some idea of what it takes to take an exploratory plot that you generally make very quickly for your own purposes and turn it into an explanatory plot that clearly communicates your results to someone else. 

As we walked through this example, you saw that it can take a lot of code to generate a polished graph. As you practice making plots in R, know that it's typical to struggle to figure out how to make the plot look exactly the way you want. Google will help here and so will people on [stack overflow](https://stackoverflow.com/). Googling your specific question and looking for solutions in R that other people have already come up with is a great place to start whenever you're stuck trying to figure out something on a plot. Also, really great explanatory plots take time. It's ok to spend a lot of time making a single important plot that effectively communicates your point.  

![It can take a lot of code](images/05_exploratory_to_explanatory/05_dataviz_exploratory_to_explanatory-20.png)


### Slides and Video
  
![Making Plots In R](https://www.youtube.com/watch?v=Dh2v9_t08Ns)
  
 * [Slides](https://docs.google.com/presentation/d/1HZFgSe0m8_Ehwvd674AkdpOnnGiir5oluvIi68C_icI/edit?usp=sharing)
  
  
{quiz, id: quiz_05_exploratory_to_explanatory}
  
### From Exploratory to Explanatory quiz
  
{choose-answers: 4}
?1 What is the goal of the title on your plot?
  
C) tell viewers what they will see on the plot
C) inform viewers what to take away from the plot
o) define what variables are on your axes
o) choose the appropriate colors 
o) ggplot2 won't make a plot without one
o) explain all the data on the plot in detail
o) tell ggplot2 what shapes to put on the plot

{choose-answers: 4}
?2 To finalize your plot you may want to add text onto your plot. What could you use?

C) annotate("text")
m) annotate("rect")
o) axis.text
o) element_text()
o) add_text("text")
o) add.text("text")

{choose-answers: 4}
?2 To finalize your plot you may want to add a rectangular box onto your plot to hightlight a portion of the plot. What could you use?

C) annotate("rect")
m) annotate("text")
o) axis.text
o) element_text()
o) add_text("text")
o) add.text("text")

{choose-answers: 4}
?3 To increase or decrease the thickness of a line on a line plot, where do you specify its size?

C) geom_line()
o) theme()
o) geom_dl()
o) annotate()
o) line_thickness()
o) line_size
o) line(size=3)
o) lwd()

{choose-answers: 4}
?4 In the final plot generated, what piece of information discussed as necessary is missing from this plot?

C) information about the data source
C) axis labels
o) any data
o) an informative title
o) labels for each line
o) values on the axes
o) annotation
o) data labels

{choose-answers: 4}
?5 To add a caption to a plot, what would you use? (Note: this isn't discussed in this lecture. It may require Googling for the answer.)

C) labs(caption = "")
o) ggcaption("")
o) geom_caption("")
o) ggplot(caption = "")
o) ggplot2(caption = "")
o) labels(caption = "")

{points:3}
?6 Go to the [Chromebook Data Science Space on RStudio Cloud](https://rstudio.cloud/spaces/3919/join?access_code=RUUQ%2BeEgKea0oMF7EJy4UePldyBBMu7d0amv2KFC) and click on your copy of the 'swirl' project (If you haven't made a copy yet, do so now.) Then, type `swirl()` to get started. Tell Swirl your first name when it asks what to call you. Then, type the number that corresponds to the course `CBDS Data Visualization`. Type the number that corresponds to the lesson `L05 Exploratory to Explanatory Q01 Swirl`. Do this swirl module! Once complete, paste the code at the end of the lesson here.

! /.*[EvXQ||Qnja||e1J3||cKex||lCBk||R2IT||bZZQ||Svki||ICYL||PpLl].*/i


{points:3}
?7 Within the same course on swirl: `CBDS Data Visualization`, navigate to the lesson `L05 Exploratory to Explanatory Q02 Swirl`. Do this swirl module! Once complete, paste the code provided at the end of the swirl module here.

! /.*[Xyxr||W1YF||rFjC||Cgyh||gmV2||JCDu||OpCd||ipcn||NgMn||xb5O].*/i

{points:3}
?8 Within the same course on swirl: `CBDS Data Visualization`, navigate to the lesson `L05 Exploratory to Explanatory Q03 Swirl`. Do this swirl module! Once complete, paste the code provided at the end of the swirl module here.

! /.*[f1fg||TKXk||VS2F||OJWE||MkxZ||NQSv||gm5Q||JbxY||hd3q||DL3R].*/i


{points:3}
?9 Within the same course on swirl: `CBDS Data Visualization`, navigate to the lesson `L05 Exploratory to Explanatory Q04 Swirl`. Do this swirl module! Once complete, paste the code provided at the end of the swirl module here.

! /.*[DMom||FUX0||EXFF||IzwC||mE4Y||oYuF||8yi2||Qwz0||5MvV||tNnc].*/i



{/quiz}


{exercise, id: exercise_05_exploratory_to_explanatory}

### DataCamp:  Introduction to the Tidyverse

{case-sensitive: false}
? To get more practice with data wrangling and plotting using `ggplot2`, go to the course [Introduction to the Tidyverse](https://www.datacamp.com/courses/introduction-to-the-tidyverse) on DataCamp. Login and complete the entire course.

Once you've completed this course course, type "completed" in the box below.

*Note*: This requires a DataCamp login, which costs money. As an exercise, this is not required to pass the course but it *will* help you get a better grasp on the concepts covered in these lessons.

*Reminder*: Videos in DataCamp are essential to understanding the material. It's best not to skip over these videos!

! completed

{/exercise}
