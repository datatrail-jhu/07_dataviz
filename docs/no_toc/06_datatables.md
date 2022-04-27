---
output: html_document
date: '2022-04-11'
---



# Data Tables

So far, we've spent a fair amount of time discussing how to make great exploratory and explanatory plots. However, plots are not the only ways to display data. Often, a table is a perfect approach to summarizing and displaying your data. In this lesson, we'll discuss *when* to consider making a table instead of a plot, *what* to consider when making your table, and *how* to make tables in R and RMarkdown.

### What are Data Tables?

Data tables are used to display data in a tabular format. They display the information in rows and columns. **Good** data tables do this in a meaningful and concise way. Similar to plots, tables can be exploratory (help you to better understand the data) or explanatory (beautifully and clearly display information in a table to others).

{format: png}
![Exploratory vs. explanatory tables](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/export/png?id=147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk&pageid=g35798d27dd_0_249)

In this lesson we will focus on characteristics of good plots and discuss how to take tables from exploratory to explanatory.

### When to Make a Table

Just as for deciding what type of plot to make given the data you want to display, it's important to consider what you're trying to convey when making a table. Tables are effective when you want to display summary information about a dataset or when you want to display top results from an analysis.

#### Summarize dataset information

When you have an entire dataset, it's often nice to have a table that summarizes important pieces of information. For example if you had a dataset with information on 32 different cars, you may be interested in the difference between cars in that dataset that have automatic vs. manual transmissions. Rather than go through and try to count them in this dataset, a table can do a nice job quickly summarizing and displaying this information for you. For example, you could display summarized information across a number of variables, such as how many of each type of car there are in your dataset (N), how fuel efficient the cars in each group are on average (mpg), the average weight of the cars in each group (weight), their average horsepower in each group (horsepower). This information can be easily displayed in a table. A table is better than a plot here because you're trying to summarize information across a few different variables. A single plot that attempted to include all of this information would be less clear than this table. Similarly, four separate plots -- one for each variable -- would take up much more space. Thus, a table is the right approach here to display these data.

{format: png}
![Sample summary tables](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/export/png?id=147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk&pageid=g2bfdb07292_0_151)

#### Summarize top results

Tables are also helpful when you want to display information about the top results from an analysis (i.e. the top 10 best-selling books, the business that had the highest sales last year, etc.).

For example, if you had information about 162,049 different flights that departed the Pacific Northwest in 2014 and wanted to know which destinations had the longest average delay for flights out of the Pacific Northwest, you could use a data table to display these results. At a glance from this table we can clearly see which airports had the longest delay in arrival time without .

{format: png}
![Top results table](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/export/png?id=147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk&pageid=g35798d27dd_0_23)

### What to Consider When Making A Table

When making a table, it's important to keep the ordering and spacing of your table in mind. It's important to make sure everything is labeled appropriately and values within the table are displayed sensibly. More specifically, we'll discuss a number of considerations to make when designing tables.

#### What to put in columns and what to put in rows

The human eye is much better at comparing values up and down rather than from left to right. Consider what comparisons you want viewers to be able to make easily when looking at the table. Then, put those in a column, rather than in a row.

{format: png}
![Results vertically are better than comparing horizontally](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/export/png?id=147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk&pageid=g35798d27dd_0_57)


#### The order of rows

Consider the data you're putting in the table. If you're displaying data over time, make sure the rows are in chronological order. If you're displaying data about individuals, it's likely best to order alphabetically by last name. Make sure that the order of rows helps viewers understand the table most quickly.

For example, if you are displaying a table about longest delay in flight time arrival, it's likely best to order the table from longest delay in the first row to shorter delays at the bottom of the table.

{format: png}
![Order rows logically](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/export/png?id=147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk&pageid=g35798d27dd_0_150)


#### The order of columns

Put the most informative and important columns at the left and the less important columns at the right to assist viewers who read from left to right. (In languages where reading occurs from right to left, the ordering of columns should be reversed.)

Here, if we want viewers to understand which airports had the longest delays, it makes the most logical sense to start with the airport name at the left, rather than the mean arrival delay time, giving viewers some context about what they're looking at before getting to the actual numbers.

{format: png}
![Order columns with most important information at left](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/export/png?id=147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk&pageid=g35798d27dd_0_157)


#### The number of rows and columns

Viewers should be able to figure out what the table is saying at a quick glance. If there are too many rows or too many columns, your data should most likely be a plot, not a table.

For example, if you are displaying information about arrests in each of the 50 US states, it may be better to consider plots, as it's difficult to draw any conclusions about these data across 50 different rows. However, when we are only comparing across 5 rows, as in the case of our top results from the flights analysis, we can easily make comparisons across these five airports whose data are included in the table.

{format: png}
![Limit the number of rows and columns](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/export/png?id=147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk&pageid=g35798d27dd_0_164)

#### Labels

Labels on your columns and rows should be informative and clear. If talking about the price of diamonds, a bad column label would be "P" and a better column label would be "price." An even better column label would be "price (USD)." This label is preferred because it provides viewers with the unit for the values in the table, conveying that these prices are all in US dollars. Viewers should be able to easily determine what information the table is displaying.

Below, the labels on the table at right are informative, whereas a viewer may not easily be able to determine what the column labels on the left (AN, AC, and MAD) mean.

{format: png}
![Labels should be informative and concise](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/export/png?id=147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk&pageid=g35798d27dd_0_171)

#### Significant digits

Including a lot of decimal places in a table is not helpful to viewers. Often, two significant digits is enough. You'll want to always double check the values in your table to make sure they are displayed appropriately before finalizing a table.

{format: png}
![Consider whether the appropriate number of digits for values in your table has been used](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/export/png?id=147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk&pageid=g35798d27dd_0_280)

#### A good title or caption

Just like with good plots, good tables should have a title or caption that is clear and concise. It should tell viewers what they should determine from the data in the table.

{format: png}
![Including a good title or caption is critical](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/export/png?id=147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk&pageid=g35798d27dd_0_178)

#### The source of the data

Like with explanatory graphs, it's important to include the source of the data used in your table at the bottom of the table when finalizing a table.

{format: png}
![Always include the source of the data in your table](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/export/png?id=147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk&pageid=g35798d27dd_0_185)

With an idea of how to make a great explanatory table, you're ready to start practicing making your own in R.

### Additional resources
[Intro to table design](https://design-nation.icons8.com/intro-to-data-tables-design-349f55861803)
[Data Tables in R slideshow](http://www.stats.uwo.ca/faculty/murdoch/ism2013/4tables.pdf)

### Slides and Video

![Data Tables](https://youtu.be/pY8pBmmgjNA)

* [Slides](https://docs.google.com/presentation/d/147UQaZBB5RoTpzsNiqkqEr4N8fcHBMB6eNr_5IdksRk/edit?usp=sharing)
