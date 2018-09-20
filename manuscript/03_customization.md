# Customization in ggplot2

In the previous lesson, we walked through the steps of generating a number of different graphs (using different `geoms`) in `ggplot2`. We discussed the basics of mapping variables to your graph to customize its appearance or aesthetic (using size, shape, and color within `aes()`. In this lesson, we'll build on what we've previously learned to really get down to how to customize your plots so that they're as clear as possible for communicating your results to others. 

The skills learned in this lesson will help take you from generating exploratory plots that help *you* better understand your data  
to explanatory plots -- plots that help you communicate your results *to others*. We'll cover how to customize the colors, labels, legends, and text used on your graph.

Since we're already familiar with it, we'll again use the `diamonds` dataset that we've been using to learn about `ggplot2`.

### Colors

To get started, we'll learn how to control color across plots in `ggplot2`. in the last lesson we discussed using color within `aes()` on a scatterplot to automatically color points by the clarity of the diamond when looking at the relationship between price and carat.

![color within `aes()` to color points](images/03_customization/03_dataviz_customization-1.png) 

However, what if we wanted to carry this concept over to a bar plot and look at how many diamonds we have of each clarity group?

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity))
```
![diamonds broken down by clarity](images/03_customization/03_dataviz_customization-2.png)

Well that's a start since we see the breakdown, but all the bars are the same color. What if we adjusted color within `aes()`?

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, color = clarity))
```
![color does add color but around the bars](images/03_customization/03_dataviz_customization-3.png)

As expected, color added a legend for each level of clarity; however, it colored the lines around the bars on the plot, rather than the bars themselves. In order to color the bars themselves, you want to specify the more helpful argument `fill`:

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, fill = clarity))
```
![`fill` automatically colors the bars](images/03_customization/03_dataviz_customization-4.png)

Great! We now have a plot with bars of different colors, which was our first goal! However, adding colors here, while maybe making the plot prettier doesn't actually give us any more information. We can see the same pattern of which clarity is most frequent among the diamonds in our dataset that we could in the first plot we made. 

Color is particularly helpful here, however, if we wanted to map a different variable onto each bar. For example, what if we wanted to see the breakdown of diamond "cut" within each "clarity" bar? 

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, fill = cut))
```
![mapping a different variable to fill provides new information](images/03_customization/03_dataviz_customization-5.png)

Now we're getting some new information! We can see that each level in clarity appears to have diamonds of all levels of cut. Color here has really helped us understand more about the data.

But what if we were going to present these data? While there is no comparison between red and green (which is good!), there is a fair amount of yellow in this plot. Some projectors don't handle projecting yellow well, and it will show up too light on the screen. To avoid this, let's manually change the colors in this bar chart! To do so we'll add an additional layer to the plot using `scale_fill_manual`.

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, fill = cut)) +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4"))
```
![manually setting colors using `scale_fill_manual`](images/03_customization/03_dataviz_customization-6.png)

Here, we've specified five different colors within the `values` argument of `scale_fill_manual()`, one for each cut of diamond. The names of these colors can be specified using the names explained on the third page of the cheatsheet [here](https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/colorPaletteCheatsheet.pdf). (Note: There are other ways to specify colors within R. Explore the details in that cheatsheet to better understand the various ways!)

Additionally, it's important to note that here we've used `scale_fill_manual` to adjust the color of what was mapped using `fill = cut`. If we had colored our chart using `color` within `aes()`, there is a different function called `scale_color_manual`. This makes good sense! You use scale_fill_manual() with `fill` and scale_color_manual() with `color`. Keep that in mind as you adjust colors in the future!

Now that we have some sense of which clarity is most common in our diamonds dataset and were able to successfully specified the colors we wanted manually in order to make this plot useful for presentation, what if we wanted to compare the proportion of each cut across the different clarities?  Currently that's difficult because there is a different number within each clarity. In order to compare the proportion of each cut we have to use **position adjustment**. 

What we've just generated is a **stacked bar chart**. It's a pretty good name for this type of chart as the bars fur cut are all stacked on top of one another. If you don't want a stacked bar chart you could use one of the other `position` options: `identity`, `fill`, or `dodge`.

Returning to our question about proportion of each cut within each clarity group, we'll want to use `position = "fill"`. Building off of what we've already done:

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "fill") +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4"))
```

![`position = "fill"` allows for comparison of proportion across groups](images/03_customization/03_dataviz_customization-7.png)

Here, we've specified how we want to adjust the position of the bars in the plot. Each bar is now of equal height and we can compare each colored bar across the different clarities. As expected, we see that among the best clarity group (IF), we see more diamonds of the best cut ("Ideal")!

Briefly, we'll take a quick detour to look at `position = "dodge"`. This position adjustment places each object *next to one another*. This will not allow for easy comparison across groups, as we just saw with the last group but will allow values within each clarity group to be visualized.

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "dodge") +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4"))
```
![`position = "dodge"` helps compare values within each group](images/03_customization/03_dataviz_customization-8.png)

Unlike in the first plot where we specified `fill = cut`, we can actually see the relationship between each cut within the lowest clarity group (I1). Before, when the values were stacked on top of one another, we were not able to visually see that there were more "Fair" and "Premium" cut diamonds in this group than the other cuts. Now, with `position = "dodge"`, this information is visually apparent.

Note: `position = "identity"` is not very useful for bars, as it *places each object exactly where it falls within the graph*. For bar charts, this will lead to *overlapping bars*, which is not visually helpful. However, for scatterplots (and other 2-Dimensional charts), this is the default and is exactly what you want.  

### Labels

Text on plots is incredibly helpful. A good title tells viewers what they should be getting out of the plot. Axis labels are incredibly important to inform viewers of what's being plotted. Annotations on plot help guide viewers to important points in the plot. We'll discuss how to control all of these now!

#### Titles 

Now that we have an understanding of how to manually adjust color, let's improve the clarity of our plots by including helpful labels on our plot by adding an additional `labs()` layer. We'll return to the plot where we were comparing proportions of diamond cut across diamond clarity groups.

You can include a `title`, `subtitle`, and/or `caption` within the `labs()` function. Each argument, as per usual, will be specified by a comma. 

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "fill") +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
  labs( title = "Clearer diamonds tend to be of higher quality cut",
        subtitle = "The majority of IF diamonds are an \"Ideal\" cut")
```

 ![`labs()` adds helpful tittles, subtitles, and captions](images/03_customization/03_dataviz_customization-9.png)
 
#### Axis labels
 
You may have noticed that our y-axis label says "count", but it's not actually a count anymore. In reality, it's a proportion. Having appropriately labeled axes is *so important*. Otherwise, viewers won't know what's being plotted. So, we should really fix that now using the `ylab()` function. Note: we won't be changing the x-axis label, but if you were interested in doing so, you would use `xlab("label") `.

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "fill") +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
  labs( title = "Clearer diamonds tend to be of higher quality cut",
        subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
  ylab("proportion")
```

![Accurate axis labels are incredibly important](images/03_customization/03_dataviz_customization-10.png)

 
### Themes

To change the overall aesthetic of your graph, there are 8 themes built into `ggplot2` that can be added as an additional layer in your graph:

![themes](images/03_customization/03_dataviz_customization-11.png)

For example, if we wanted remove the gridlines and grey background from the chart, we would use `theme_classic()`. Building on what we've already generated:

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "fill") +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
  labs( title = "Clearer diamonds tend to be of higher quality cut",
        subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
  ylab("proportion") +
  theme_classic()
```
![`theme_classic` changes aesthetic of our plot](images/03_customization/03_dataviz_customization-12.png)

We now have a pretty good looking plot! However, a few additional changes would make this plot *even better* for communication.

Note: Additional themes are available from the [`ggthemes` package](https://cran.r-project.org/web/packages/ggthemes/vignettes/ggthemes.html). Users can also generate their own themes.

### Theme

In addition to using available themes, we can also adjust parts of the theme of our graph using an additional `theme()` layer. There are **a lot** of options within theme. To see them all, look at the help documentation within RStudio Cloud using: `?theme`. We'll simply go over the syntax for using a few of them here to get you comfortable with adjusting your theme. Later on, you can play around with all the options on your own to become an expert!

#### Altering text size

For example, if we want to increase text size to make it more easily viewable when presenting this graph, we would do that within theme. Notice here that we're increasing the text size of the `title`, `axis.text`, `axis.title`, and `legend.text` all within `theme()`! The syntax here is important. Within each of the elements of the theme you want to alter, you have to specify what it is you want to change. Here, for all three, we want to later text, so we specify `element_text()`. Within that, we specify that it's `size` that we want to adjust. 

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "fill") +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
  labs( title = "Clearer diamonds tend to be of higher quality cut",
        subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
  ylab("proportion") +
  theme_classic() +
  theme( title = element_text(size = 18), 
         axis.text = element_text(size =14),
         axis.title = element_text(size = 16),
         legend.text = element_text(size = 14) )
```
![`theme()` allows us to adjust font size](images/03_customization/03_dataviz_customization-13.png)

#### Additional text alterations

Changing the size of text on your plot is not the only thing you can control within `theme()`. You can make text **bold* and change its color within `theme()`. Note here that multiple changes can be made to a single element. We can change size and make the text **bold**. All we do is separate each argument with a comma, per usual.

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "fill") +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
  labs( title = "Clearer diamonds tend to be of higher quality cut",
        subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
  ylab("proportion") +
  theme_classic() +
  theme( title = element_text(size = 18), 
         axis.text = element_text(size = 14),
         axis.title = element_text(size = 16, face = "bold"),
         legend.text = element_text(size = 14),
         plot.subtitle = element_text(color = "gray30") )
```
![`theme()` allows us to tweak many parts of our plot](images/03_customization/03_dataviz_customization-14.png)

Any alterations to plot spacing/background, title, axis, and legend will all be made within `theme()`

### Legends

At this point, all the text on the plot is pretty visible! However, there's one thing that's still not quite clear to viewers. In daily life, people refer to the "cut" of a diamond by terms like "round cut" or "princess cut" to describe the *shape* of the diamond. That's not what we're talking about here when we're discussing "cut". In these data, "cut" refers to the quality of the diamond, not the shape. Let's be sure that's clear as well! We can change that using an additional layer and `guides()`!

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "fill") +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
  labs( title = "Clearer diamonds tend to be of higher quality cut",
        subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
  ylab("proportion") +
  theme_classic() +
  theme( title = element_text(size = 18), 
         axis.text = element_text(size = 14),
         axis.title = element_text(size = 16, face = "bold"),
         legend.text = element_text(size = 14),
         plot.subtitle = element_text(color = "gray30") ) +
  guides(fill = guide_legend("cut quality")) 
```

![`guide()` allows us to change the legend title](images/03_customization/03_dataviz_customization-15.png)

At this point, we have an informative title, clear colors, a well-labeled legend, and text that is large enough throughout the graph. This is certainly a graph that could be used in a presentation. We've taken it from a graph that is useful to just ourselves (exploratory) and made it into a plot that can communicate our findings well to others (explanatory)! 

We have touched on a number of alterations you can make by adding additional layers to a ggplot. In the rest of this lesson we'll touch on a few more changes you can make within `ggplot2` using a slightly different graph.

### Scales

There may be times when you want a different number of values to be displayed on an axis. The scale of your plot for **continuous variables** (i.e. numeric variables) can be controlled using `scale_x_continuous` or `scale_y_continuous`. Here, we want to increase the number of labels displayed on the y-axis, so we'll use `scale_y_continuous`:

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity)) +
  scale_y_continuous(breaks = seq(0, 17000, by = 1000))
```

![Continuous cales can be altered](images/03_customization/03_dataviz_customization-16.png)

However, for **discrete variables** (aka factors or categorical variables), where there is a limited number of levels, you would use `scale_x_discrete` or `scale_y_discrete`:

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity)) +
  scale_x_discrete(limit = c("SI2", "SI1", "I1")) +
  scale_y_continuous(breaks = seq(0, 17000, by = 1000)) 
  
```
![Discrete scales can be altered](images/03_customization/03_dataviz_customization-17.png)

### Coordinate Adjustment

There are times when you'll want to flip your axis. This can be accomplished using `coord_flip()`. Adding an additional layer to the plot we just generated switches our x- and y-axes, allowing for horizontal bar charts, rather than the default 
vertical bar charts:

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity)) +
  scale_y_continuous(breaks = seq(0, 17000, by = 1000)) +
  scale_x_discrete(limit = c("SI2", "SI1", "I1")) +
  coord_flip() +
  labs( title = "Clearer diamonds tend to be of higher quality cut",
        subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
  ylab("proportion") +
  theme_classic() +
  theme( title = element_text(size = 18), 
         axis.text = element_text(size = 14),
         axis.title = element_text(size = 16, face = "bold"),
         legend.text = element_text(size = 14),
         plot.subtitle = element_text(color = "gray30") ) +
  guides(fill = guide_legend("cut quality")) 
```

![Axes can be flipped using `coord_flip`](images/03_customization/03_dataviz_customization-18.png)

It's important to remember that all the additional alterations we already discussed can still be applied to this graph! 

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity)) +
  scale_y_continuous(breaks = seq(0, 17000, by = 1000)) +
  scale_x_discrete(limit = c("SI2", "SI1", "I1")) +
  coord_flip() +
  labs( title = "Number of diamonds by diamond clarity",
        subtitle = "Subset of all diamonds, looking three levels of clarity") +
  theme_classic() +
  theme( title = element_text(size = 18), 
         axis.text = element_text(size = 14),
         axis.title = element_text(size = 16, face = "bold"),
         legend.text = element_text(size = 14),
         plot.subtitle = element_text(color = "gray30") ) 
```

![Additional layers will help customize this plot](images/03_customization/03_dataviz_customization-19.png)

### Annotation

Finally, there will be times when you'll want to add text to a plot or to annotate points on your plot. We'll discuss briefly how to accomplish that here!

To add text to your plot, we can use the function `annotate`. This requires us to specify that we want to annotate here with a "text" geom (rather than say a shape, like a rectangle - "rect"). Additionally, we have to specify what we'd like that text to say (`label`), where on the plot we'd like that text to show up (using `x` and `y` for coordinates), how we'd like the text aligned (using `hjust` for horizontal alignment where the options are "left", "center", or "right" and `vjust` for vertical alignment where the arguments are "top", "center" or "bottom"), and how big we'd like that text to be (`size`):

```r
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity)) +
  scale_y_continuous(breaks = seq(0, 17000, by = 1000)) +
  scale_x_discrete(limit = c("SI2", "SI1", "I1")) +
  coord_flip() +
  labs( title = "Number of diamonds by diamond clarity",
        subtitle = "Subset of all diamonds, looking three levels of clarity") +
  theme_classic() +
  theme( title = element_text(size = 18), 
         axis.text = element_text(size = 14),
         axis.title = element_text(size = 16, face = "bold"),
         legend.text = element_text(size = 14),
         plot.subtitle = element_text(color = "gray30") ) +
  annotate("text", label = "SI1 diamonds are among \n the most frequent clarity diamond", 
           y = 12800, x = 2.9, 
           vjust = "top", hjust = "right", 
           size = 6)
```
![`annotate` helps add text to our plot](images/03_customization/03_dataviz_customization-20.png)

Note: we could have accomplished this by adding an additional `geom`: `geom_text`. However, this requires creating a new data frame, as explained [here](http://r4ds.had.co.nz/graphics-for-communication.html#annotations). This can also be used to **label the points on your plot**. Keep this reference in mind in case you have to do that in the future.

### Summary

In this lesson we've covered how to manually change the colors of your plot in R, how to use built-in `ggplot2` themes, how to tailor your plot to look exactly how you want it to look within `theme()`, how to customize legends, how to scale axes, how to flip coordinates, and how to annotate your plots. What's important to remember is that `ggplot2` is flexible and benefits from its layered nature. Additionally, it's important to remember that the last lesson and this lesson have just touched the surface of what's capable in `ggplot2`. You'll certainly run into things when graphing that were not covered in this lesson, and that's great! That means you're beginning to master `ggplot2`. Use what you've learned here and additional online available resources to generate any plot you can think of!

### Additional References

* [Color Cheatsheet](https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/colorPaletteCheatsheet.pdf)
* [`ggthemes` package](https://cran.r-project.org/web/packages/ggthemes/vignettes/ggthemes.html) - [GitHub repo](https://github.com/jrnold/ggthemes)
* [R4DS: Chapter 3](http://r4ds.had.co.nz/data-visualisation.html)
* [R4DS: Chapter 18](http://r4ds.had.co.nz/graphics-for-communication.html)


### Slides and Video
  
![Customization in ggplot2](https://www.youtube.com/watch?v=gWpeeDvow1c)
  
 * [Slides](https://docs.google.com/presentation/d/1fAPq_QX6hzNLal4tPRLuAjuHbVYn3sXC1Y7EoK0tNJE/edit?usp=sharing)
  
  
{quiz, id: quiz_03_customization}
  
### Customization in ggplot2 quiz
 
{choose-answers: 4}
? To plot side by side bar plots, what **position adjustment** would you specify?

C) `position = "dodge"`
o) `position = "identity"`
o) `position = "stacked"`
o) `position = "fill"`
o) `position = "repel"`
o)  `position = "side-by-side"`

{choose-answers: 4}
? To switch your x-axis and put it on the y-axis and flip to put your y-axis on the x, what function would you use?

C) `coord_flip()`
o) `flip_coord()`
o) `coordinates_flip()`
o) `flip_coordinates()`
o) `coord_swap()`
o) `swap_coord()`
o) `coordinates_swap()`
o) `swap_coordinates()`

{choose-answers: 4}
? Which built in `ggplot2` theme is the default theme in ggplot2?

C) `theme_gray()`
m) `theme_classic()`
o) `theme_dark()`
o) `theme_light()`
o) `theme_bw()`
o)  `theme_void()`
o)  `theme_linderaw()`
o)  `theme_minimal()`

{choose-answers: 4, points: 2}
? Explore the `ggthemes` package by clicking on [this link](https://cran.r-project.org/web/packages/ggthemes/vignettes/ggthemes.html)), which theme is based on the scales and colors used at [www.fivethirtyeight.com](www.fivethirtyeight.com)

C) theme_fivethirtyeight
o) theme_538
o) theme_igray
o) theme_stata
o) theme_solarized
o) theme_tufte
o) theme_base
o) theme_538.com

{choose-answers: 4, points: 2}
? To specify that you want the x-axis (but *not* the y-axis) text to be bold, what would you include within `theme()`?

C) axis.text.x = element_text(face = "bold")
o) axis.text.x = element_text(font = "bold")
o) axis.text.x = element_text(text = "bold")
o) axis.text = element_text(face = "bold")
o) axis.text = element_text(font = "bold")
o) axis.text = element_text(text = "bold")

{points:3}
? Go to the [Chromebook Data Science Space on RStudio Cloud](https://rstudio.cloud/spaces/3919/join?access_code=RUUQ%2BeEgKea0oMF7EJy4UePldyBBMu7d0amv2KFC) and click on your copy of the 'swirl' project (If you haven't made a copy yet, do so now.) Then, type `swirl()` to get started. Tell Swirl your first name when it asks what to call you. Then, type the number that corresponds to the course `CBDS Data Visualization`. Type the number that corresponds to the lesson `L03 Customization ino ggplot2 Q01 Swirl`. Do this swirl module! Once complete, paste the code at the end of the lesson here.

! /.*[ytPZ||oxqw||kEXQ||zuGw||xS8N||vylx||sfRN||hrAW||Av8M||oLlA].*/i


{points:3}
? Within the same course on swirl: `CBDS Data Visualization`, navigate to the lesson `L03 Customization in ggplot2 Q02 Swirl`. Do this swirl module! Once complete, paste the code provided at the end of the swirl module here.

! /.*[eb8n||NdLf||68cW||837Z||RoaY||WGz5||tD1Z||UYCd||7fgV||q9jQ].*/i

{points:3}
? Within the same course on swirl: `CBDS Data Visualization`, navigate to the lesson `L03 Customization in ggplot2 Q03 Swirl`. Do this swirl module! Once complete, paste the code provided at the end of the swirl module here.

! /.*[UX1M||S4mY||9xRm||Vy42||q6EQ||3ySX||opD8||oZKK||uQuY||a03H].*/i

{points:3}
? Within the same course on swirl: `CBDS Data Visualization`, navigate to the lesson `L03 Customization in ggplot2 Q04 Swirl`. Do this swirl module! Once complete, paste the code provided at the end of the swirl module here.

! /.*[cjSD||Fnox||l1N2||Da9p||AyxS||cAzt||XeA1||4Ljo||3ND3||3gGy].*/i

{points:3}
? Within the same course on swirl: `CBDS Data Visualization`, navigate to the lesson `L03 Customization in ggplot2 Q05 Swirl`. Do this swirl module! Once complete, paste the code provided at the end of the swirl module here.

! /.*[kQaq||G21y||osGJ||unnD||5Hzf||z44s||pa3m||DuUx||xmMN||uPbf].*/i

{/quiz}


{exercise, id: exercise_03_customization}

### DataCamp:  Data Visualization with gpplot2 (Part 2)

{case-sensitive: false}
? To get more practice with `ggplot2` plot generation and customication go to the course [ Data Visualization with gpplot2 (Part 2)](https://www.datacamp.com/courses/data-visualization-with-ggplot2-2) on DataCamp. Login and complete the second and third chapters of the course.

- Coordinates and Facets
- Themes

Once you've completed the these two chapters, type "completed" in the box below.

*Note*: This requires a DataCamp login, which costs money. As an exercise, this is not required to pass the course but it *will* help you get a better grasp on the concepts covered in these lessons.

*Reminder*: Videos in DataCamp are essential to understanding the material. It's best not to skip over these videos!

! completed

{/exercise}
