# Good Plots

The goal of data visualization in data analysis is to improve understanding of the data. As mentioned in the last lesson, this could mean improving our own understanding of the data *or* using visualization to improve someone else's understanding of the data. 

We discussed some general characteristics and basic types of plots in the last lesson, but here we will step through a number of general tips for making good plots. 

### Tips for Making Good Plots

#### Choose the right type of plot

If your goal is to allow the viewer to compare values across groups, pie charts should largely be avoided. This is because it's easier for the human eye to differentiate between bar heights than it is between similarly-sized slices of a pie. Thinking about the best way to visualize your data before making the plot is an important step in the process of data visualization.

{format: png}
![Choose an appropriate plot for the data you're visualizing.](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g313fe11f0c_0_445)

#### Be mindful when choosing colors

Choosing colors that work for the story you're trying to convey with your visualization is important. Avoiding colors that are hard to see on a screen or when projected, such as pastels, is a good idea. Additionally, red-green color blindness is common and leads to difficulty in distinguishing reds from greens. Simply avoiding making comparisons between these two colors is a good first step when visualizing data. 

{format: png}
![Choosing appropriate colors for visualizations is important](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g313fe11f0c_0_146)

Beyond red-green color blindness, there is an entire group of experts out there in color theory.To learn more about available [color palettes in R](https://github.com/EmilHvitfeldt/r-color-palettes) or to read more from a pro named Lisa Charlotte Rost [talking about color choices in data visualization](https://lisacharlotterost.github.io/2016/04/22/Colors-for-DataVis/), feel free to read more.

#### Label your axes

Whether you're making an exploratory or explanatory visualization, labeled axes are a must. They help tell the story of the figure. Making sure the axes are clearly labeled is also important. Rather than labeling the graph below with "h" and "g," we chose the labels "height" and "gender," making it clear to the viewer exactly what is being plotted.

{format: png}
![Having descriptive labels on your axes is critical](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g313fe11f0c_0_180)

#### Make sure text is readable

Often text on plots is too small for viewers to read. By being mindful of the size of the text on your axes, in your legend, and used for your labels, your visualizations will be greatly improved.

{format: png}
![On the right, we see that the text is easily readable](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g313fe11f0c_0_232)

#### Make sure your numbers add up

When you're making a plot that should sum to 100, make sure that it in fact does. Taking a look at visualizations after you make them to ensure that they make sense is an important part of the data visualization process. 

{format: png}
![At left, the pieces of the pie only add up to 95%. On the right, this error has been fixed and the pieces add up to 100%](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g313fe11f0c_0_336)

#### Make sure the numbers and plots make sense together

Another common error is having labels that don't reflect the underlying graphic. For example, here, we can see on the left that the turquoise piece is more than half the graph, and thus the label 45% must be incorrect. At right, we see that the labels match what we see in the figure.

{format: png}
![Checking to make sure the numbers and plot make sense together is important](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g313fe11f0c_0_351)

#### Make comparisons easy on viewers

There are many ways in which you can make comparisons easier on the viewer. For example, avoiding unnecessary whitespace between the bars on your graph can help viewers make comparisons between the bars on the barplot.

{format: png}
![At left, there is extra white space between the bars of the plot that should be removed. On the right, we see an improved plot](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g313fe11f0c_0_0)


#### Use y-axes that start at zero

Often, in an attempt to make differences between groups look larger than they are, y-axis will be started at a value other than zero. This is misleading. Y-axis for numerical information should start at zero. 
{format: png}
![At left, the differences between the vars appears larger than on the right; however, this is just because the y-axis starts at 200. The proper way to start this graph is to start the y-axis at 0.](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g313fe11f0c_0_299)

#### Keep it simple

The goal of data visualization is to improve understanding of data. Sometimes complicated visualizations cannot be avoided; however, when possible, keep it simple. 

{format: png}
![Here, the graphic does not immediately convey a main point. It's hard to interpret what each circle means or what the story of this graphic is supposed to me. Make sure in your graphics that your main point comes through](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g313fe11f0c_0_390)

{format: png}
![Similarly, the intention of your graphic should never be to mislead and confuse. Unlike what was done here, be sure that your data visualizations improve viewers' understanding. Do not aim to confuse](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g313fe11f0c_0_463)

### What To Consider When Making Plots

Having discussed some general guidelines, there are a number of questions you should ask yourself before making a plot. These have been nicely laid out in a [blog post](https://blog.datawrapper.de/better-charts/) from the wonderful team at [Chartable](https://blog.datawrapper.de/), [Datawrapper's](https://www.datawrapper.de/) blog. We will summarize them here and include a number of the images from their post. The post argues that there are three main questions you should ask any time you create a visual display of your data. We will discuss these three questions below and then step through the process of creating data displays in R.

{format: png}
![Three Questions for Creating a Chart](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g3a100c29e0_0_39)

1. What's your point?
2. How can you emphasize your point in your chart?
3. What does your final chart show exactly?


#### The Data We Want to Plot

When discussing data visualization, it's always good to have an example to look at. For the example here, we'll use the same example [Lisa Charlotte Rost](https://twitter.com/lisacrost) used in her blog post. If you were interested in analyzing data that looked to assess the success of the iPhone, you would want to look at data to see how sales of iPhones have changed over time. You might, for example, start with a super basic plot like this:

{format: png}
![iPhone Sales over time](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g3a100c29e0_0_44)

#### What's your point?

Whenever you have data you're trying to plot, think about what you're actually trying to show. Once you've taken a look at your data, a good title for the plot can be helpful. Your title should **tell viewers what they'll see when they look at the plot**. 

For the iPhone example, a reasonable headline would be **"iPhone more successful than all other Apple products." This tells us what others would expect to conclude from looking at the data in the figure. 

{format: png}
![iPhone Sales over time with title](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g3a100c29e0_0_50)

#### How can you emphasize your point?

We talked about it in the last lesson, but an incredibly important decision is that, choosing an appropriate chart for the type of data you have is very important. In the next section of this lesson, we'll discuss what type of data are appropriate for each type of plot in R; however, for now, we'll just focus on the iPhone data example. With this example, we'll discuss that you can emphasize your point by:

* adding data
* highlighting data with color
* annotating your plot


##### Adding data

With our example data set, our title suggests that the iPhone has been Apple's most successful product. To make that claim, it would be really helpful for the plot to compare iPhone sales with other Apple products, say, the iPad or the iPod. By adding data about other Apple products over time, we can visualize just how successful the iPhone has been.

{format: png}
![iPhone Sales over time vs other Apple Products](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g3a100c29e0_0_56)

##### Highlighting data with color

Colors help direct viewers' eyes to the most important parts of the figure. Colors tell your readers where to focus their attention. Grays help to tell viewers where to focus less of their attention, while other colors help to highlight the point your trying to make.

For example, in the iPhone example, we can de-emphasize the iPod and iPad data using gray lines, while really highlighting the huge amount of growth of the iPhone, by making its line red.

{format: png}
![iPhone Sales, in red, over time vs other Apple Products, in gray](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g3a100c29e0_0_61)

##### Annotate your plot

By highlighting parts of your plot with arrows or text on your plot, you can further draw viewers' attention to certain part of the plot. These are often details that are unnecessary in exploratory plots, where the goal is just to better understand the data, but are very helpful in explanatory plots, when you're trying to draw conclusions from the plot. 

In the iPhone example, by highlighting when Apple announced the iPhone 4 in 2010 and adding text to explain that this was the first time that more iPhones were sold than iPods, viewers get a better understanding of the data.

{format: png}
![iPhone sales over time annotated](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g3a100c29e0_0_66)

#### What does your final chart show?

The first step of the process told viewers what they would see in the plot. The second step showed them. The third step makes it extra clear to viewers what they should be seeing. You explain to viewers what they should be seeing in the plot. This is where you are sure to add descriptions, legends, and the source of your data. Again, these are important pieces of creating a complete explanatory plot, but are not all necessary when making exploratory plots.

##### Write precise descriptions 

Whether it's a figure legend at the bottom of your plot, a subtitle explaining what data are plotted, or clear axes labels, text describing clearly what's going on in your plot is important. Here, the author of these plots decided to include a subtitle, "Worldwide sales of selected Apple products in million, by fiscal quarter, 2000 to 2014." She could have similarly included this information on the y-axis "Worldwide sales of Apple products (in millions)." While there are different approaches, including this information is critical.

{format: png}
![iPhone sales over time annotated with description](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g3a100c29e0_0_72)

##### Add legends 

When making a plot, be sure that viewers are able to easily determine what each line or point on a plot represents. Here, by adding text to label which line is iPhone, which is iPad, and which is iPod, viewers are quickly able to understand the plot

{format: png}
![iPhone sales over time annotated with description and text labels](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g3a100c29e0_0_78)

##### Add a source

When finalizing an explanatory plot, be sure to source your data. It's always best for readers to know where you obtained your data and what data are being used to create your plot. Transparency is important.

{format: png}
![iPhone sales over time with source information](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g3a100c29e0_0_86)

The finalized plot is clear, the conclusion the viewer is to make is obvious, the data are well-labeled, and the plot is annotated.

{format: png}
![Final blog post plot](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g3a100c29e0_0_92)

### Making The iPhone Plot in R

Here, we'll introduce the code required to generate the plot used as an example in this lesson in R, but we won't walk through this code step-by-step until a later lesson. We include this now to make two points:

1. Once you have access to the data, you **can** manipulate plots to look the way you want.
2. It often takes a lot of somewhat complicated code to reproduce someone else's beautiful plot.


As to the second point above, while the code here is rather complicated, you'll see that the code required to make basic plots in R is quite simple. Once you master the basics, you'll be able to start generating more and more complex plots, building on the basic building blocs that we'll go over in the next lesson!

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
{format: png}
![Reproduced blog post plot](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/export/png?id=1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w&pageid=g3a100c29e0_0_102)

While the plots are not identical, they are very similar and tell the same story. Making good plots in R is an important skill and can be learned using the `ggplot2` package in R. We'll discuss how to generate `ggplot2` plots in the next lesson!

### Additional Resources 

To learn more about bad plotting techniques to avoid, you can check out Flowing Data's [Ugly Charts](http://flowingdata.com/category/visualization/ugly-visualization/) or [WTF Visualizations](http://viz.wtf/). 

To see examples of beautiful data visualizations, check out Nathan Yau's [Flowing Data](http://flowingdata.com/) blog, the  [Chartable](https://blog.datawrapper.de/) blog, or many analytical pieces published by [FiveThirtyEight](http://fivethirtyeight.com/).

To read more about red-green color blindness, read more information [here](http://www.colourblindawareness.org/colour-blindness/).

To read more about Data Visualization and the goals of Data Visualization read Elijah Meek's [Data Visualization Fast and Slow](https://medium.com/@Elijah_Meeks/data-visualization-fast-and-slow-d2653d4850b0) - links to the rest of the posts in this series are included there.

### Slides and Video

![Good Plots](https://youtu.be/-QDzybJJExc)

* [Slides](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/edit?usp=sharing)


{quiz, id: quiz_01_good_plots}

### Good Plots quiz

{choose-answers: 4}
?1 Why is it important to start the y-axis at 0?

C) to avoid misleading viewers
C) it's the least misleading way to display the data
o) it's the law
o) it's mandatory when graphing in R
o) to help color-blind viewers
o) it minimizes whitespace
 
{choose-answers: 4}
?2 Which of these is something you should do when visualizing data?

C) using contrasting colors for comparison
C) include axis labels
C) minimize unnecessary whitespace
o) minimize label text size
o) assume whatever chart is made first is right
o) exclude axes labels to save space
o) only use red and green in your charts
o) make sure text is small to highlight the data

{choose-answers: 4}
?3 If a pie chart is made up of exactly two slices that appear similar in size, what is a reasonable value for one of those slices? 

C) 51%
C) 49%
C) 50%
m) 33%
o) 2%
o) 10%
o) 100%
o) 90%
o) 4%
o) 95%

{choose-answers: 4}
?3 If a pie chart is made up of exactly three slices that all appear similar in size, what is a reasonable value for one of those slices? 

C) 33%
o) 51%
o) 49%
o) 50%
o) 2%
o) 10%
o) 100%
o) 90%
o) 4%
o) 95%

{choose-answers: 4}
?4 If a plot is getting too busy, what is a reasonable approach to take?

C) Simplify the plot's design to highlight your main point.
C) Rethink the plot's design to simply the plot.
o) Use a lot of different colors to explain all the different points you're trying to make.
o) Explain the complicated plot with a lot of text underneath the figure.
o) Leave it as is. People will figure it out.
o) Overlay as much text as possible to help explain the busy figure.
o) Add an additional busy figure to help explain the first figure

{choose-answers: 4}
?5 In the iPhone plot example used in the lesson, what is one way the figure generator "emphasize the point" in their chart?

C) used red to highlight most important data on the plot
C) used a grey box to help highlight an important portion of the plot 
C) used text annotation to help highlight an important portion of the plot 
o) used grey text on a grey background to highlight data on the plot
o) used red and green for comparison
o) started the y-axis at 50 to make the point
o) removed values from axes to just highlight the lines
o) removed all text from the plot to just show the data
o) chose to use a pie chart
o) chose to only use grey, black, and white to keep it simple

{/quiz}
