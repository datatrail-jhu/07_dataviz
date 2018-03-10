# Good Plots

The goal of data visualization in data analysis is to improve understanding of the data. As mentioned in the last lesson, this could mean improving our own understanding of the data *or* using visualization to improve someone else's understanding of the data. 

We discussed some general characteristics and basic types of plots in the last lesson, but here we will step through a number of general tips for making good plots. 

### Tips for Making Good Plots

#### Choose the right type of plot

If your goal is to allow the viewer to compare values across groups, pie charts should largely be avoided. This is because it's easier for the human eye to differentiate between bar heights than it is between similarly-sized slices of a pie. Thinking about the best way to visualize your data before making the plot is an important step in the process of data visualization.

![Choose an appropriate plot for the data you're visualizing.](images/01_good_plots/01_dataviz_good_plots-1.png)

#### Be mindful when choosing colors

Choosing colors that work for the story you're trying to convey with your visualization is importnat. Avoiding colors that are hard to see on a screen or when projected, such as pastels, is a good idea. Additionally, red-green color blindness is common and leads to difficulty in distinguishing reds from greens. Simply avoiding making comparisons between these two colors is a good first step when visualizing data. 

![Choosing appropriate colors for visualiations is important](images/01_good_plots/01_dataviz_good_plots-2.png)

Beyond red-green color blindness, there is an entire group of experts out there in color theory.To learn more about available [color palletes in R](https://github.com/EmilHvitfeldt/r-color-palettes) or to read more from a pro named Lisa Charlotte Rost [talking about color choices in data visualization](https://lisacharlotterost.github.io/2016/04/22/Colors-for-DataVis/), feel free to read more.

#### Label your axes

Whether you're making an exploratory or explanatory visualization, labeled axes are a must. They help tell the story of the figure. Making sure the axes are clearly labeled is also important. Rather than labeling the graph below with "h" and "g," we chose the labels "height" and "gender," making it clear to the viewer exactly what is being plotted.

![Having descriptive labels on your axes is critical](images/01_good_plots/01_dataviz_good_plots-3.png)

#### Make sure text is readable

Often text on plots is too small for viewers to read. By being mindful of the size of the text on your axes, in your legend, and used for your labels, your visualizations will be greatly improved.

![On the right, we see that the text is easily readable](images/01_good_plots/01_dataviz_good_plots-4.png)

#### Make sure your numbers add up

When you're making a plot that should sum to 100, make sure that it in fact does. Taking a look at visualizations after you make them to ensure that they make sense is an important part of the data visualization process. 

![At left, the pieces of the pie only add up to 95%. On the right, this error has been fixed and the pieces add up to 100%](images/01_good_plots/01_dataviz_good_plots-5.png)

#### Make sure the numbers and plots make sense together

Another common error is having labels that don't reflect the underlying graphic. For example, here, we can see on the left that the turquoise piece is more than half the graph, and thus the label 45% must be incorrect. At right, we see that the labels match what we see in the figure.

![Checking to make sure the numbers and plot make sense together is important](images/01_good_plots/01_dataviz_good_plots-6.png)

#### Make comparisons easy on viewers

There are many ways in which you can make comparisons easier on the viewer. For example, avoiding unnecessary whitespace between the bars on your graph can help viewers make comparisons between the bars on the barplot.

![At left, there is extra white space between the bars of the plot that should be removed. On the right, we see an improved plot](images/01_good_plots/01_dataviz_good_plots-7.png)


#### Use y-axes that start at zero

Often, in an attempt to make differences between groups look larger than they are, y-axis will be started at a value other than zero. This is misleading. Y-axis for numerical information should start at zero. 
![At left, the differences between the vars appears larger than on the right; however, this is just because the y-axis starts at 200. The proper way to start this graph is to start the y-axis at 0.](images/01_good_plots/01_dataviz_good_plots-8.png)

#### Keep it simple

Lastly, the goal of data visualization is to improve understanding of data. Sometimes complicated visualizations cannot be avoided; however, when possible, keep it simple. 

![Here, the graphic does not immediately convey a main point. It's hard to interpret what each circle means or what the story of this graphic is supposed to me. Make sure in your graphics that your main point comes through](images/01_good_plots/01_dataviz_good_plots-9.png)

![Similarly, the intention of your graphic should never be to mislead and confuse. Unlike what was done here, be sure that your data visualizations improve viewers' understanding. Do not aim to confuse](images/01_good_plots/01_dataviz_good_plots-10.png)

### Additional Resources 

To learn more about bad plotting techniques to avoid, you can check out Flowing Data's [Ugly Charts](http://flowingdata.com/category/visualization/ugly-visualization/) or [WTF Visualizations](http://viz.wtf/). 

To see examples of beautiful data visualizations, check out Nathan Yau's [Flowing Data](http://flowingdata.com/) blog, the  [Uncharted](https://blog.datawrapper.de/) blog, or many analytical pieces published by [FiveThirtyEight](http://fivethirtyeight.com/).

### Slides and Video

![Good Plots](UPDATE LINK)

* [Slides](https://docs.google.com/presentation/d/1j6GOwIwvDwwmec6PaQlQGyYORn3a0j4EiZHoUbQN5_w/edit?usp=sharing)


{quiz, id: quiz_01_good_plots}

### Good Plots quiz

? Why is it important to start the y-axis at 0?

A) to avoid misleading viewers
b) it's the law
c) it's mandatory when graphing in R
d) to help color-blind viwers

? Which of these is something you should do when visualizing data?

a) minimize label text size
B) using contrasting colors for comparison
c) assume whatever chart is made first is right
d) exclude axes labels to save space

? If a pie chart is made up of exactly two slices that appear similar in size, what is a reasonable value for one of those slices? 

a) 2%
B) 51%
c) 10%
d) 100%

? If a plot is getting too busy, what is a reasonable approach to take?

A) Simplify the plot's design to highlight your main point.
b) Use a lot of different colors to explain all the different points you're trying to make.
c) Explain the complicated plot with a lot of text underneath the figure.
d) Leave it as is. People will figure it out.

{/quiz}