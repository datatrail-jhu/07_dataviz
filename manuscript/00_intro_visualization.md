{
course-completeness: 100
course-attempts: 2
default-quiz-attempts: 2
default-random-choice-order: true
}

# Intro to Data Visualization

Data visualization is an incredibly important part of any data science project. When you are first handed a data set by your boss or first scrape a large dataset from the Internet, visualizing your data can help you get a handle on what's going on in the data set. Similarly, once you've done your analysis and are ready to communicate your findings to your teammates, data visualizations are an effective way to communicate your results to others. In this lesson, we'll walk through what data visualization is and define some of the basic types of data visualizations.

### Data Visualization

At its core, the term 'data visualization' refers to any visual display of data that helps us understand the underlying data better. This can be a plot or figure of some sort or a table that summarizes the data. Generally, there are a few characteristics of all good plots.

#### General Features of Plots

Good plots have a number of features. While not exhaustive, good plots have:
1. Clearly-labeled axes.
2. Text that are large enough to see.
3. Axes that are not misleading.
4. Data that are displayed appropriately considering the type of data you have.


More specifically, however, there are two general approaches to data visualization: exploratory plots and explanatory plots.

#### Exploratory Plots

These are **data displays to help you better understand and discover hidden patterns in the data** you're working with. These won't be the prettiest plots, but they will be incredibly helpful. Exploratory visualizations have a number of general characteristics:

* They are made quickly.
* You'll make a large number of them.
* The axes and legends are cleaned up.


Below we have a graph where the axes are labeled and general pattern can be determined. This is a great example of an exploratory plot. It lets you the analyst know what's going on in your data, but it isn't yet ready for a big presentation.

![Exploratory Plot](images/00_intro_visualization/00_dataviz_intro_visualization-3.png)

As you're trying to understand the data you have on hand, you'll likely make a lot of plots and tables just to figure out to explore and understand the data. Because there are a lot of them and they're for your use (rather than for communicating with others), you don't have to spend all your time making them perfect. But, you do have to spend enough time to make sure that you're drawing the right conclusions from this. Thus, you don't have to spend a long time considering what colors are perfect on these, but you do want to make sure your axis are not cut off.  

Other Exploratory Plotting Examples:
[Map of Reddit](http://opensource.datacratic.com/mtlpy50/)
[Air Quality Data](https://blog.datazar.com/exploratory-data-analysis-using-r-part-i-17e4e8e03961)

### Explanatory Plots 

These are data displays that aim to communicate insights to others. These are plots that you spend a lot of time making sure they're easily interpretable by an audience. General characteristics of explanatory plots:

* They take a while to make.
* There are only a few of these for each project.
* You've spent a lot of time making sure the colors, labels, and sizes are all perfect for your needs.


Here we see  an improvement upon the exploratory plot we looked at previously. Here, the axis labels are more descriptive. All of the text is larger. The legend has been moved onto the plot. The points on the plot are larger. And, there is a title. All of these changes help to improve the plot, making it an explanatory plot that would be presentation-ready.

![Explanatory Plots](images/00_intro_visualization/00_dataviz_intro_visualization-4.png)

Explanatory plots are made after you've done an analysis and once you really understand the data you have. The goal of these plots is to communicate your findings clearly to others. To do so, you want to make sure these plots are made carefully - the axis labels should all be clear, the labels should all be large enough to read, the colors should all be carefully chosen, etc.. As this takes times and because you do not want to overwhelm your audience, you only want to have a few of these for each project. We often refer to these as "publication ready" plots. These are the plots that would make it into an article at the New York Times or in your presentation to your bosses.

Other Explanatory Plotting Examples:
[How the Recession Shaped the Economy (NYT)](https://www.nytimes.com/interactive/2014/06/05/upshot/how-the-recession-reshaped-the-economy-in-255-charts.html)
[2018 Flue Season (FiveThirtyEight)](https://fivethirtyeight.com/features/america-should-have-stayed-home-this-flu-season/)

### Types of Plots

Above we saw data displayed as both an exploratory plot and an explanatory plot. That plot was an example of a scatterplot. However, there are many types of plots that are helpful. We'll discuss a few basic ones below and will include links to a few galleries where you can get a sense of the many different types of plots out there.

To do this, we'll use the "Davis" dataset which includes, height and weight information for 200 people.

![Data Set](images/00_intro_visualization/00_dataviz_intro_visualization-5.png)

#### Histogram

Histograms are helpful when you want to better understand what values you have in your data set for a single set of numbers. For example, if you had a dataset with information about many people, you may want to know how tall the people in your data set are. To quickly visualize this, you could use a histogram. Histograms let you know what range of values you have in your data set. For example, below you can see that in this data set, the height values range from around 50 to around 200 cm. The shape of the histogram also gives you information about the individuals in your dataset. The number of people at each height are also counted. So, the tallest bars show that there are about 40 people in the data set whose height is between 165 and 170 cm. Finally, you can quickly tell, at a glance that most people in this data set are at least 150 cm tall, but that there is at least one individually whose reported height is much lower. 

![Histogram](images/00_intro_visualization/00_dataviz_intro_visualization-6.png) 

#### Scatterplot

Scatterplots are helpful when you have **numerical values for two different pieces of information** and you want to understand the relationship between those pieces of information. Here, each dot represents a different person in the data set. The dot's position on the graph represents that individual's height and weight. Overall, in this data set, we can see that, in general, the more someone weighs, the taller they are. Scatterplots, therefore help us at a glance better understand the relationship between two sets of numbers.

![Scatter Plot](images/00_intro_visualization/00_dataviz_intro_visualization-9.png)

#### Barplot

When you only have **one numerical piece of information** and a **second piece of information that can be broken down into a few categories**, a barplot will help you make numerical comparisons across categories. For example if you wanted to look at how many females and how many males you have in your data set, you could use a barplot.  The comparison in heights between bars clearly demonstrates that there are more females in this dataset than males. 

![Barplot](images/00_intro_visualization/00_dataviz_intro_visualization-11.png)

#### Boxplot

The final basic plot we'll talk about here is the boxplot. Boxplots also summarize **numerical values across a category**; however, instead of just comparing the heights of the bar, they give us an idea of the range of values that each category can take. For example, if we wanted to compare the heights of men to the heights of women, we could do that with a boxplot.

![Boxplot](images/00_intro_visualization/00_dataviz_intro_visualization-13.png)

To interpret a boxplot, there are a few places where we'll want to focus our attention. For each category, the horizontal line through the middle of the box corresponds to the median value for that group. So, here, we can say that the median, or most typical height for females is about 165 cm. For males, this value is higher, just under 180 cm. Outside of the colored boxes, there are dashed lines. The ends of these lines correspond to the typical range of values. Here, we can see that females tend to have heights between 150 and 180cm. Lastly, when individuals have values outside the typical range, a boxplot will show these individuals as circles. These circles are referred to as outliers.

#### Resources to look at these and other types of plots:
* [R Graph Gallery](https://www.r-graph-gallery.com/)
* [Ferdio Data Visualization Catalog](http://datavizproject.com/)


### Tables

While we have focused on figures here so far, tables can be incredibly informative at a glance too. If you are looking to display summary numbers, a table can also visually display information. 
Using this same data set, we can use a table to get a quick breakdown of how many males and females there are in the data set and what percentage of each gender there is.

A few things to keep in mind when making tables is that it's best to:

* Limit the number of digits in the table
* Include a caption
* When possible, keep it simple.


![Table](images/00_intro_visualization/00_dataviz_intro_visualization-17.png)

### Slides and Video

![Intro to Data Visualization](UPDATE LINK)

* [Slides](https://docs.google.com/presentation/d/1MiYOmyqu6Et6mBVTS91gip8h-tids8Wo0JDlMfXULqE/edit?usp=sharing)


{quiz, id: quiz_00_intro_visualization}

### Intro to Data Visualization quiz

  
? When you've spent a lot of time perfecting the details of your plot, what type of plot have you created?
  
a) exploratory
B) explanatory

{choose-answers: 4}
? Which plot is best when comparing numerical values from two pieces of information?

C) Scatterplot
o) Histogram
o) Barplot
o) Clustering
o) Pie Chart
o) Heatmap

{choose-answers: 4}
? What type of plot would you use to compare the number of apples and oranges in a data set containing information about different pieces of fruit?

C) Barplot
o) Heatmap
o) Histogram
o) Donut Chart
o) Network Diagram

{choose-answers: 4}
? If half of your data set were comprised of men and half of females, what number should you put in the table to represent the percentage of females?

C) 50%
o) 0
o) 49.879%
o) 50.0000% 
o) 100.00% 
o) NA

{choose-answers: 4}
? To quickly see the range of values for a numerical piece of information and how many individuals take that value, what plot would you use?

C) Histogram
o) Barplot
o) Boxplot
o) Scatterplot
o) Pie Chart
o) Heatmap

{/quiz}