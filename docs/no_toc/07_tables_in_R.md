---
output: html_document
date: '2022-04-11'
---



# Tables in R

Now that we have a good understanding of what to consider when making tables, we can to practice making good tables in R. To do this, we'll return to the diamonds data set. As a reminder, this dataset contains prices and other information about ~54,000 different diamonds. If we want to provide viewers with a summary of these data, we may want to provide information about diamonds broken down by the quality of the diamond's cut. To get the data we're interested in, we'll use the `diamonds` dataset and the `dplyr` R package, which we discussed in a lesson in an earlier course.

### Getting the data in order

To start figuring out how the quality of the cut of the diamond affects the price of that diamond, we first have to first get the data in order. To do that, we'll use the `dplyr` package that you learned about in an earlier course in this series. This allows us to group the data by the quality of the cut (`cut`) before summarizing the data to determine the number of diamonds in each category (`N`), the minimum price of the diamonds in this category (`min`), the average price (`avg`), and the highest price in the category (`max`).

To get these data in order, you could use the following code. This code groups the data by cut (quality of the diamond) and then calculates the number of diamonds in each group (N), the minimum price across each group (min), the average price of diamonds across each group (avg), and the maximum price within each group (max):

```r
library(dplyr)

df <- diamonds %>%
  group_by(cut) %>%
  dplyr::summarize(
    N = n(),
    min = min(price),
    avg = mean(price),
    max = max(price)
  )
```

### An exploratory table

```r
df
```

By getting the data summarized into a single object in R (`df`), we're on our way to making an informative table. However, this is clearly just an exploratory table. The output in R from this code follows some of the good table rules above, but not all of them.  At a glance, it will help you to understand the data, but it's not the finished table you would want to send to your boss.

{format: png}
![Exploratory diamonds table](https://docs.google.com/presentation/d/1vjyG1vibsmtXrPA1hs2HS3MfjsPMjRDEmBEsVlgkIxg/export/png?id=1vjyG1vibsmtXrPA1hs2HS3MfjsPMjRDEmBEsVlgkIxg&pageid=g35798d27dd_0_0)

From this output, you, the creator of the table, would be able to see that there are a number of **good qualities**:

* there is a **reasonable number of rows and columns** - There are 5 rows and 5 columns. A viewer can quickly look at this table and determine what's going on.
* the first column `cut` is **organized logically** - The lowest quality diamond category is first and then they are ordered vertically until the highest quality cut (`ideal))
* Comparisons are made **top to bottom** - To compare between the groups, your eye only has to travel up and down, rather than from left to right.

There are also things that **need to be improved** on this table:

* **column headers** could be even more clear
* there's **no caption/title**
* It could be more **aesthetically pleasing**

### Improving the table output

By-default, R outputs tables in the Console using a monospaced font. However, this limits our ability to format the appearance of the table. To fix the remaining few problems with the table's format, we'll use the `kable()` function from the R package `knitr` and the additional formatting capabilities of the R packages `kableExtra`.

The first step to a prettier table just involves using the `kable()` function from the `knitr` package, which improves the readability of this table

```r
kable(df)
```

{format: png}
![kable basic output](https://docs.google.com/presentation/d/1vjyG1vibsmtXrPA1hs2HS3MfjsPMjRDEmBEsVlgkIxg/export/png?id=1vjyG1vibsmtXrPA1hs2HS3MfjsPMjRDEmBEsVlgkIxg&pageid=g361cf16451_0_18)

However, there are still a few issues we want to improve upon:

* column names could be more informative
* too many digits in the `avg` column
* Caption/title is missing
* Source of data not included.

To begin addressing these issues, we can use the `add_header_above` function from `kableExtra()` to specify that the min, avg, and max columns refer to `price` in US dollars (USD). Additionally, `kable()` takes a `digits` argument to specify how many significant digits to display. This takes care of the display of too many digits in the `avg` column. Finally, we can also style the table so that every other row is shaded, helping our eye to keep each row's information separate from the other rows using `kable_styling()` from `kableExtra`.  These few changes really improve the readability of the table.

If you copy this code into your R console, the formatted table will show up in the Viewer tab at the bottom right-hand side of your RStudio console and the HTML code used to generate that table will appear in your console.

```r
library(knitr)
library(kableExtra)

kable(df, digits=0, "html") %>%
  kable_styling("striped", "bordered") %>%
  add_header_above(c(" " = 2,  "price (USD)" = 3))
```  

{format: png}
![Viewer tab with formatted table](https://docs.google.com/presentation/d/1vjyG1vibsmtXrPA1hs2HS3MfjsPMjRDEmBEsVlgkIxg/export/png?id=1vjyG1vibsmtXrPA1hs2HS3MfjsPMjRDEmBEsVlgkIxg&pageid=g35798d27dd_0_6)

### Annotating your table

We mentioned earlier that captions and sourcing your data are incredibly important. The `kable` package allows for a `caption` argument. Below, an informative caption has been included. Additionally, `kableExtra` has a `footnote()` function. This allows you to include the source of your data at the bottom of the table. With these final additions, you have a table that clearly displays the data and could be confidently shared with your boss.

```r
kable(df, digits=0, "html", caption="Table 1: Diamonds Price by Quality of Cut. Most Diamonds are of the highest quality cut and the most expensive diamonds are of the highest quality") %>%
  kable_styling("striped", "bordered") %>%
  add_header_above(c(" " = 2,  "price (USD)" = 3)) %>%
  footnote(general="Diamonds dataset from ggplot2", general_title="Source:",footnote_as_chunk = T)
```  
{format: png}
![Viewer tab with annotated and formatted table](https://docs.google.com/presentation/d/1vjyG1vibsmtXrPA1hs2HS3MfjsPMjRDEmBEsVlgkIxg/export/png?id=1vjyG1vibsmtXrPA1hs2HS3MfjsPMjRDEmBEsVlgkIxg&pageid=g35798d27dd_0_17)

### Tables in RMarkdown

So far, this has all been done within RStudio. However, in a lesson in an earlier course in this series, we discussed the importance of making reports in RMarkdown. The previous lesson focused on how to format RMarkdown documents generally. Here we want to point out that tables made using `kable()` are properly formatted for RMarkdown reports.

{format: png}
![Code and table rendered from RMarkdown document](https://docs.google.com/presentation/d/1vjyG1vibsmtXrPA1hs2HS3MfjsPMjRDEmBEsVlgkIxg/export/png?id=1vjyG1vibsmtXrPA1hs2HS3MfjsPMjRDEmBEsVlgkIxg&pageid=g35798d27dd_0_12)

Similar to how we approached learning about making figures in R, we've demonstrated how to make good tables with a single example. The best way to really learn how to make tables is to practice using the tips here and playing around within R. So, feel free to use this as a start and go practice making a few beautiful tables in R!

### Additional resources
[Karl Broman's approach to tables in R](http://kbroman.org/knitr_knutshell/pages/figs_tables.html)
[knitr documentation](https://cran.r-project.org/web/packages/knitr/knitr.pdf)
[kableExtra package documentation](https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html)


### Slides and Video

![Tables in R](https://youtu.be/EQUi8P1CQLY)

* [Slides](https://docs.google.com/presentation/d/1vjyG1vibsmtXrPA1hs2HS3MfjsPMjRDEmBEsVlgkIxg/edit?usp=sharing)
