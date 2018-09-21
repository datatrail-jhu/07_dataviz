# Data Tables

So far, we've spent a fair amount of time discussing how to make great exploratory and explanatory plots. However, plots are not the only ways to display data. Often, a table is a perfect approach to summarizing and displaying your data. In this lesson, we'll discuss *when* to consider making a table instead of a plot, *what* to consider when making your table, and *how* to make tables in R and RMarkdown. 

### What are Data Tables?

Data tables are used to display data in a tabular format. They display the information in rows and columns. **Good** data tables do this in a meaningful and concise way. Similar to plots, tables can be exploratory (help you to better understand the data) or explanatory (beautifully and clearly display information in a table to others).

![Exploratory vs. explanatory tables](images/06_datatables/06_dataviz_datatables-1.png)

In this lesson we will focus on characteristics of good plots and discuss how to take tables from exploratory to explanatory.

### When to Make a Table

Just as for deciding what type of plot to make given the data you want to display, it's important to consider what you're trying to convey when making a table. Tables are effective when you want to display summary information about a dataset or when you want to display top results from an analysis.

#### Summarize dataset information 

When you have an entire dataset, it's often nice to have a table that summarizes important pieces of information. For example if you had a dataset with information on 32 different cars, you may be interested in the difference between cars in that dataset that have automatic vs. manual transmissions. Rather than go through and try to count them in this dataset, a table can do a nice job quickly summarizing and displaying this information for you. For example, you could display summarized information across a number of variables, such as how many of each type of car there are in your dataset (N), how fuel efficient the cars in each group are on average (mpg), the average weight of the cars in each group (weight), their average horsepower in each group (horsepower). This information can be easily displayed in a table. A table is better than a plot here because you're trying to summarize information across a few different variables. A single plot that attempted to include all of this information would be less clear than this table. Similarly, four separate plots -- one for each variable -- would take up much more space. Thus, a table is the right approach here to display these data.

![Sample summary tables](images/06_datatables/06_dataviz_datatables-2.png)

#### Summarize top results

Tables are also helpful when you want to display information about the top results from an analysis (i.e. the top 10 best-selling books, the business that had the highest sales last year, etc.).

For example, if you had information about 162,049 different flights that departed the Pacific Northwest in 2014 and wanted to know which destinations had the longest average delay for flights out of the Pacific Northwest, you could use a data table to display these results. At a glance from this table we can clearly see which airports had the longest delay in arrival time without .

![Top results table](images/06_datatables/06_dataviz_datatables-3.png)

### What to Consider When Making A Table

When making a table, it's important to keep the ordering and spacing of your table in mind. It's important to make sure everything is labeled appropriately and values within the table are displayed sensibly. More specifically, we'll discuss a number of considerations to make when designing tables.

#### What to put in columns and what to put in rows

The human eye is much better at comparing values up and down rather than from left to right. Consider what comparisons you want viewers to be able to make easily when looking at the table. Then, put those in a column, rather than in a row.

![Results vertically are better than comparing horizontally](images/06_datatables/06_dataviz_datatables-4.png)


#### The order of rows

Consider the data you're putting in the table. If you're displaying data over time, make sure the rows are in chronological order. If you're displaying data about individuals, it's likely best to order alphabetically by last name. Make sure that the order of rows helps viewers understand the table most quickly.

For example, if you are displaying a table about longest delay in flight time arrival, it's likely best to order the table from longest delay in the first row to shorter delays at the bottom of the table.

![Order rows logically](images/06_datatables/06_dataviz_datatables-5.png)


#### The order of columns

Put the most informative and important columns at the left and the less important columns at the right to assist viewers who read from left to right. (In languages where reading occurs from right to left, the ordering of columns should be reversed.) 

Here, if we want viewers to understand which airports had the longest delays, it makes the most logical sense to start with the airport name at the left, rather than the mean arrival delay time, giving viewers some context about what they're looking at before getting to the actual numbers.

![Order columns with most important information at left](images/06_datatables/06_dataviz_datatables-6.png)


#### The number of rows and columns

Viewers should be able to figure out what the table is saying at a quick glance. If there are too many rows or too many columns, your data should most likely be a plot, not a table.

For example, if you are displaying information about arrests in each of the 50 US states, it may be better to consider plots, as it's difficult to draw any conclusions about these data across 50 different rows. However, when we are only comparing across 5 rows, as in the case of our top results from the flights analysis, we can easily make comparisons across these five airports whose data are included in the table.

![Limit the number of rows and columns](images/06_datatables/06_dataviz_datatables-7.png)

#### Labels

Labels on your columns and rows should be informative and clear. If talking about the price of diamonds, a bad column label would be "P" and a better column label would be "price." An even better column label would be "price (USD)." This lavel is preferred because it provides viewers with the unit for the values in the table, conveying that these prices are all in US dollars. Viewers should be able to easily determine what information the table is displaying.

Below, the labels on the table at right are informative, whereas a viewer may not easily be able to determine what the column labels on the left (AN, AC, and MAD) mean. 

![Labels should be informative and concise](images/06_datatables/06_dataviz_datatables-8.png)

#### Significant digits 

Including a lot of decimal places in a table is not helpful to viewers. Often, two significant digits is enough. You'll want to always double check the values in your table to make sure they are displayed appropriately before finalizing a table.

![Consider whether the appropriate number of digits for values in your table has been used](images/06_datatables/06_dataviz_datatables-9.png)

#### A good title or caption

Just like with good plots, good tables should have a title or caption that is clear and concise. It should tell viewers what they should determine from the data in the table. 

![Including a good title or caption is critical](images/06_datatables/06_dataviz_datatables-10.png)

#### The source of the data

Like with explanatory graphs, it's important to include the source of the dat used in your table at the bottom of the table when finalizing a table.

![Always include the source of the data in your table](images/06_datatables/06_dataviz_datatables-11.png)

With an idea of how to make a great explanatory table, you're ready to start practicing making your own in R.

### Additional resources
[Intro to table design](https://design-nation.icons8.com/intro-to-data-tables-design-349f55861803)
[Data Tables in R slideshow](http://www.stats.uwo.ca/faculty/murdoch/ism2013/4tables.pdf)

### Slides and Video

![Data Tables](https://www.youtube.com/watch?v=JbZYSHI3Iek)

* [Slides](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/edit?usp=sharing)


{quiz, id: quiz_06_datatables}

### Data Tables quiz

{choose-answers:4}
?1 If displaying information about individuals' income, how should the rows be ordered when displayed in a data table?

C) by last name
o) by address
o) in order of house number
o) by telephone number
o) by middle name
o) by grandfather's first name
o) by grandmother's first name

{choose-answers:4}
?2 When choosing labels for a table including information about individuals and their income, which column labels would be best?

C) last, first, address, city, phone, income
c) last_name, first_name, address, city, phone_number, income
o) LN, FN, A, C, P, I
o) LAST OR GIVEN NAME, FIRST NAME OR PREFERRED NAME, STREET ADDRESS WHERE CURRENTLY LIVING, CITY OF RESIDENCE, PHONE NUMBER INCLUDING AREA CODE, INCOME
o) ln, fn, a, c, p, i
o) l, f, a, c, p, i
o) L, F, A, C, P, I

{choose-answers:4}
?3 When should you use a plot instead of a table? 

C) when there is a lot of data that cannot be summarized in a table
C) when the information can be understood more quickly in a plot
C) when the information can be understood more easily in a plot
o) when summarizing the samples in a data set
o) when displaying a few of the top results from an analysis
o) when trying to display information across a few different variables for a few people
o) when summarizin a few metrics about the samples in a study


{choose-answers:4}
?4 If the exact number is 3.4050234492349, which value is likely the best value to display in a table?

C) 3.4
m) 7.4
o) 3.4050234
o) 3
o) 3.4050234492349

{choose-answers:4}
?4 If the exact number is 7.4050234492349, which value is likely the best value to display in a table?

C) 7.4
m) 3.4
o) 7.4050234
o) 7
o) 7.4050234492349

{/quiz}
