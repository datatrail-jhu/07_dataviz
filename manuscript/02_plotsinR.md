# Making Plots In R

RStudio and the prgoramming language R allow you to plot your data in a number of different ways. In this lesson, we'll discuss what to consider any time you're plotting your data, the types of plots you can make in R, and the code needed to make a number of different plots using R programming in RStudio.

### What To Consider When Making Plots

There are a number of questions you should ask yourself before making a plot. These have been nicely laid out in a [blog post](https://blog.datawrapper.de/better-charts/) from the wonderful team at [Uncharted](https://blog.datawrapper.de/), [Datawrapper's](https://www.datawrapper.de/) blog. We will summarize them here and include a number of the images from their post. The post argues that there are three main questions you should ask any time you create a visual display of your data. We will discuss these three questions below and then step through the process of creating data displays in R.

![Three Questions for Creating a Chart](images/02_plotsinR/02_dataviz_plotsinR-1.png)

1. What's your point?
2. How can you emphasize your point in your chart?
3. What does your final chart show exactly?

#### The Data We Want to Plot
When discussing data visualization, it's always good to have an example to look at. For the example here, we'll use the same example [Lisa Charlotte Rost](https://twitter.com/lisacrost) used in her blog post. If you were interested in analyzing data that looked to assess the success of the iPhone, you would want to look at data to see how sales of iPhones have changed over time. You might, for example, start with a super basic plot like this:

![iPhone Sales over time](images/02_plotsinR/02_dataviz_plotsinR-2.png)

#### What's your point?
Whenever you have data you're trying to plot, think about what you're actually trying to show. Once you've taken a look at your data, a good title for the plot can be helpful. Your title should **tell viwers what they'll see when they look at the plot**. 

For the iPhone example, a reasonable headline would be **"iPhone more successful than all other Apple prodcuts." This tells us what others would expect to conclude from looking at the data in the figure. 

![iPhone Sales over time with title](images/02_plotsinR/02_dataviz_plotsinR-3.png)

#### How can you emphasize your point?

We talked about it in the last lesson, but an incredibly important decision is that, choosing an appropriate chart for the type of data you have is very important. In the next section of this lesson, we'll discuss what type of data are appropriate for each type of plot in R; however, for now, we'll just focus on the iPhone data example. With this example, we'll discuss that you can emphasize your point by:
* adding data
* highlighting data with color
* annotating your plot

##### Adding data
With our example data set, our title suggests that the iPhone has been Apple's most successful product. To make that claim, it would be really helpful for the plot to compare iPhone sales with other Apple products, say, the iPad or the iPod. By adding data about other Apple products over time, we can visualize just how successful the iPhone has been.

![iPhone Sales over time vs other Apple Products](images/02_plotsinR/02_dataviz_plotsinR-4.png)

##### Highlighting data with color

Colors help direct viewers' eyes to the most important parts of the figure. Colors tell your readers where to focus their attention. Greys help to tell viwers where to focus less of their attention, while other colors help to highlight the point your trying to make.

For example, in the iPhone example, we can de-emphasize the iPod and iPad data using grey lines, while really highlighting the huge amount of growth of the iPhone, by making its line red.

![iPhone Sales, in red, over time vs other Apple Products, in grey](images/02_plotsinR/02_dataviz_plotsinR-5.png)

##### Annotate your plot
By highlighting parts of your plot with arrows or text on your plot, you can further draw viewers' attention to certain part of the plot. These are often details that are unecessary in exploratory plots, where the goal is just to better understand the data, but are very helpful in explanatory plots, when you're trying to draw conclusions from the plot. 

In the iPhone example, by highlighting when Apple announced the iPhone 4 in 2010 and adding text to explain that this was the first time that more iPhones were sold than iPods, viewers get a better understanding of the data.

![iPhone sales over time annotated](images/02_plotsinR/02_dataviz_plotsinR-6.png)

#### What does your final chart show?
The first step of the process told viewers what they would see in the plot. The second step showed them. The third step makes it extra clear to viewers what they shoudl be seeing. You explain to viewers what they should be seeing in the plot. This is where you are sure to add descriptions, legends, and the source of your data. Again, these are important pieces of creating a complete explanatory plot, but are not all necessary when making exploratory plots.

##### Write precise descriptions 

Whether it's a figure legend at the bottom of your plot, a subtitle explaining what data are plotted, or clear axes labels, text describing clearly what's going on in your plot is important. Here, the author of these plots decided to include a subtitle, "Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014." She could have similarly included this information on the y-axis "Worldwide sales of Apple products (in millions)." While there are different approaches, including this information is critical.

![iPhone sales over time annotated with description](images/02_plotsinR/02_dataviz_plotsinR-7.png)

##### Add legends 

When making a plot, be sure that viewers are able to easily determine what each line or point on a plot represents. Here, by adding text to label which line is iPhone, which is iPad, and which is iPod, viewers are quickly able to understand the plot

![iPhone sales over time annotated with description and text labels](images/02_plotsinR/02_dataviz_plotsinR-8.png)

##### Add a source

When finalizing an explanatory plot, be sure to source your data. It's always best for readers to know where you obtained your data and what data are being used to create your plot. Transparency is important.

![iPhone sales over time with source information](images/02_plotsinR/02_dataviz_plotsinR-9.png)

The finalized plot is clear, the conclusion the viewer is to make is obvious, the data are well-labeled, and the plot is annotated.

![Final blog post plot](images/02_plotsinR/02_dataviz_plotsinR-10.png)

### Making The iPhone Plot in R

Below, you will notice two things:
1. Once you have access to the data, you can manipulate plots to lok the way you want.
2. It often takes a lot of somewhat complicated code to reproduce someone else's beautiful plot.

As to point 2, while we include the complicated code here, in the next section, we'll break some of these steps down and you'll see that the code required to make basic plots in R is quite simple. 

```r
library(ggplot2)
library(reshape2)
library(zoo)
library(directlabels)

## after downloading data from https://blog.datawrapper.de/better-charts/
## read data into R
df <- read.csv("data-orzoM.csv",stringsAsFactors=FALSE)

## get quarter year variable into a form R knows how to work with
df$Year <- grep("Q",unlist(strsplit(as.character(df$Quarter),"\\s")), value=TRUE, invert=TRUE)
df$Q <- grep("Q",unlist(strsplit(as.character(df$Quarter),"\\s")), value=TRUE, invert=FALSE)
df$yrq <- paste(df$Year,df$Q, sep=" ")
df$yrq <- as.yearqtr(df$yrq)

## reshape data into long, tidy format
df2 <- melt(df, id=c("Quarter","yrq","Year", "Q"))
df2$value <- as.numeric(df2$value)

## plot data as in blog post
p <- ggplot(data = df2, aes(x=yrq,y=value, group=variable, color=variable)) +
  geom_line(size = 1.5) +
  scale_x_yearqtr(limits = c(2004, 2015),
                  format = "%Y", breaks=c(2004:2015), expand = c(0.1, 0.01)) + 
  scale_colour_manual(values = c("red3","grey","grey")) + 
  scale_y_continuous(breaks = c(0,10,20,30,40,50,60,70,80)) + 
  theme_bw() +
  theme(  panel.grid.major.x = element_blank() ,
          panel.grid.minor.x = element_blank() ,
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text = element_text(size=15),
          plot.margin = unit(c(1,1,1,1), "lines"),
          legend.position ="none",
          plot.title = element_text(size = 22),
          plot.subtitle = element_text(size = 15),
          panel.border = element_blank()
  ) +
  geom_dl(aes(label = variable), 
          method = list(c("last.points"),
          aes(colour = "black"), 
          cex = 1.3)
  ) +
  ggtitle("iPhone more successful than all other Apple products", subtitle="Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014") +
  annotate("rect", xmin = 2010, xmax = 2011, ymin = 0, ymax = Inf, fill = "grey", alpha = 0.2) +
  annotate("text", x = 2010.5, y = 40, label = "After Apple announced \n the iPhone 4 in 2010, \n more iPhones were sold \n than iPods for the first time.", hjust = 1, size=6)

## save plot as PNG  
ggsave("iPhone_sales.png",p, width=12 , units=c("in"))
```
![Reproduced blog post plot](images/02_plotsinR/02_dataviz_plotsinR-12.png)

While the plots are not identical, they are very similar and tell the same story. Making good plots in R is an important skill and can be learned using the `ggplot2` package in R.

### Plots in R

R was initially developed for statisticians, who often are interested in generating plots or figures to visualize their data. As such, a few basic plotting features were built in when R was first developed. These are all still available; however, over time, a new approach to graphing in R was developed. This new approach implemented what is known as the [grammar of graphics](http://vita.had.co.nz/papers/layered-grammar.pdf), which allows you to develop elegant graphs flexibly in R. Making plots with this set of rules requires the R package `ggplot2`. To get started using ggplot2 requires you to install and load the package into R.

```r
install.packages("ggplot2")
library(ggplot2)
```

#### ggplot2 basics

The grammar of graphics implemented in `ggplot2` is based on the idea that you can build *any* plot as long as you have a few pieces of information. To start building plots in ggplot2, we'll need some data and to know the type of plot we want to make. The type of plot you want to make in `ggplot2` is referred to as a geom. This will get us started, but the idea behind ggplot2 is that every new concept we introduce will be layered on top of the information you've already learned. So we'll start with the two basics (data and a geom) and then build from there. 

As we get started plotting in `ggplot2`, plots will take the following general form:

```r
ggplot(data = DATASET, aes(VARIABLE(S))) + 
  geom_PLOT_TYPE()
```

You will always begin by calling the `ggplot()` function. You'll then specify your dataset. Within the `ggplot()` function, you'll also specify what variables in your dataset you're interested in plotting. Before making your plot you will also have to specify what geom type you're interested in plotting. We'll focus on a few basic geoms in the next section and give examples of each plot type (geom). 

#### Making Exploratory Plots 

To build your first plot in `ggplot2` we'll make use of the fact that there are some datasets already available in R. One frequently-used data set is known as `diamonds`. This data set contains prices and other attributes of 53,940 diamonds, with each row containing information about a different diamon. If you look at the first few rows of data, you can get an idea of what data are included in this dataset. 

![First 12 rows of diamonds dataset](images/02_plotsinR/02_dataviz_plotsinR-14.png)

Here you see a lot of numbers and can get an idea of what data are available in this data set. For example, in looking at the column names across the top, you can see that we have information about how many carats each diamond is (`carat`), some information on the quality of the diamond cut (`cut`), the color of the diamond from J (worst) to D (best) (`color`), along with a number of other pieces of information about each diamond.

We will use this data set to better understand how to generate plots in R, using `ggplot2`. While we will be generating basic plots here, know that we will be discussing how to change font size, color, and graph appearance in detail later.

##### Histograms

As discussed in the first lesson in this course, histograms are helpful in displaying information about a single set of numbers. For example, if we wanted to see what the distribution of carats was for these data, we could to the following.

```r
ggplot(data = diamonds, aes(carat)) + 
  geom_histogram()
```

Note, we specified in the code above that we would be using the `diamonds` dataset, that we were interested in plotting information about the diamonds' `carat` in the plot, and that the geom we were interested in plotting was a histogram (`geom_histogram`).

![diamonds histogram](images/02_plotsinR/02_dataviz_plotsinR-15.png)


##### Scatterplots

Scatterplots show the relationship between two numeric variables. In `ggplot2` we specify these by defining `x` and `y` in the `aes()` argument. The `x` argument defines which variable will be along the bottom of the plot. `y` refers to which variable will be along the left side of the plot. If we wanted to understand the relationship between the number of carats in a diamond and that diamond's price, we may do the following:

```r
ggplot(data = diamonds, aes(x=carat, y=price)) + 
  geom_point()
```

Note that the overall format of the code is the same as it was for the histogram; however, we've defined `x=carat` and `y=price` and changed `geom_histogram` to `geom_point`.

![diamonds scatterplot](images/02_plotsinR/02_dataviz_plotsinR-16.png)

In this plot, we see that, in general, the larger the diamond is (or the more carats it has), the more expensive the diamond is (price), which is probably what we would have expected. However, now, we have a plot that supports this conclusion. 

##### Barplots

Barplots show the relationship between a set of numbers and a categorical variable. In the diamonds data set, we may be interested in knowing how many diamonds there are of each cut of diamonds. There are five categories for cut of diamond. If we make a barplot for this variable, we can see the number of diamonds in each category.

```r
ggplot(data = diamonds, aes(cut)) + 
  geom_bar()
```

Again, the changes to the code are minimal. We are now interested in plotting the categorical variable `cut` and state that we want a bar plot, by including `geom_bar()`. 

![diamonds barplot](images/02_plotsinR/02_dataviz_plotsinR-17.png)

##### Boxplots

Boxplots provide a summary of a numerical variable across categories. For example, if you were interested to see how the price of a diamond (a numerical variable) changed across different diamond color categories (categorical variable), you may want to use a boxplot.

```r
ggplot(data = diamonds, aes(x=color, y=price)) + 
  geom_boxplot()
```

In the code, we see that again, we only have to change what variables we want to be included in the plot the type of plot (or geom) we want (here, `geom_boxplot()`) to get a basic boxplot.

![diamonds box](images/02_plotsinR/02_dataviz_plotsinR-18.png)

In the figure itself we see that the median price (the black horizontal bar in the middle of each box represents the median for each category) increases as the diamond color increases from the worst category (J) to the best (D).


##### Other plots

While we've reviewed basic code to make a few common types of plots, there are a number of other plot types that can be made in `ggplot2.` These are listed in the [online reference material for ggplot2](http://ggplot2.tidyverse.org/reference/) or can be accessed through RStudio directly. To do so, you would type `?geom_` into the Console in RStudio. A list of geoms will appear. You can hover your cursor over any one of these to get a short description. 

![?geom in Console](images/02_plotsinR/02_dataviz_plotsinR-19.png)

Or, you can select a geom from this list and click enter. After selecting a geom, such as geom_abline and hitting 'Enter,' the help page for that geom will pop up in the 'Help' tab at bottom right. Here, you can find more detailed information about the selected geom.

[geom_abline help page](images/02_plotsinR/02_dataviz_plotsinR-20.png)


### Additional reources:
[R For Data Science by Hadley Wickham](http://r4ds.had.co.nz/data-visualisation.html#introduction-1)
[ggplot2 reference](http://ggplot2.tidyverse.org/reference/)

### Slides and Video
  
![Making Plots In R](UPDATE LINK)
  
  * [Slides](https://docs.google.com/presentation/d/1WRfoVxRU_dRcbMGtsha5zSokBRoAFIirm32Wq6bZuEc/edit?usp=sharing)
  
  
{quiz, id: quiz_02_plotsinR}
  
### Making Plots in R
  
? When you've spent a lot of time perfecting the details of your plot, what type of plot have you created?
  
a) exploratory
B) explanatory

? Which of these is NOT required when plotting in `ggplot2`?

a) ggplot() function call
b) the geom you want to plot
c) the variable you want to plot
D) the color you want to use

? Which geom would you specify to generate a scatterplot? 

a) geom_histogram
B) geom_point
c) geom_scatterplot
d) geom_scatter

? Which geom would you specify if you wanted to know how many individuals in a data set fell into each level of a categorical variable?

a) geom_boxplot
b) geom_scatterplot
c) geom_abline
D) geom_bar

{/quiz}