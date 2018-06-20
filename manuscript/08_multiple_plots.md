# Multiple Plots in R

When generating reports for a data science project, there is often more than one plot that you want to display at a time. To accomplish this in R, we will use the R package [patchwork](https://github.com/thomasp85/patchwork) from [Thomas Lin Pedersen](https://www.data-imaginist.com/), which simplifies this process. 

### Installing patchwork

As with other R packages you've used, you will first need to install this package. As this package is relatively new, however, it is not on CRAN so `install.packages('patchwork')` will not work. Instead, this package has to be installed using devtools. If you don't have `devtools` installed yet, do that first. If you already have that library installed, you can simply load `devtools` and then install the `patchwork` package from GitHub.

```r
# install.packages("devtools")

library(devtools)
devtools::install_github("thomasp85/patchwork")
```

### Basic plotting using patchwork

Patchwork allows any plots generated from `ggplot2` to be combined simply. For example, if you were interested in plotting data from the `mtcars` dataset in R but wanted to combine two different plots, you could use patchwork. Below, you'll see code for combining two plots. The first plot examines the relationship between how many miles per gallon (mpg) a car a gets and the weight of that car in 1000lb (wt). This is assigned to object `p1`. The second plot looks at the relationship between how many mpgs a car gets and the number of forward gears that car has (`p2`). While you could plot each individually, you may want to see them side by side. With patchwork, you can do this my simply using a plus sign (`p1+p2`). Using this very simple code, you'll obtain side by side plots, which is exactly what you were looking to achieve! 

```r
library(ggplot2)
library(patchwork)

p1 <- ggplot(mtcars) + geom_point(aes(wt, mpg))
p2 <- ggplot(mtcars) + geom_boxplot(aes(gear, mpg, group = gear))

p1 + p2
```

![Two plots side-by-side](images/08_multiple_plots/08_dataviz_multiple_plots-1.png)

### Altering the layout

If you don't want these plots side-by-side, but rather one on top of the other, this can be controlled with `plot_layout()`, where you can define the number of columns (`ncol`) or number of rows (`nrow`) you would like to display.

```r
p1 + p2 + plot_layout(ncol = 1)
```

![two plots one on top of the other](images/08_multiple_plots/08_dataviz_multiple_plots-2.png)

Similarly, if you want these on top of one another but would rather the first plot be larger, this can be controlled within `plot_layout()` using the `heights` argument. The '3' in the code below specifies that you would like the top plot to be 3 times larger than the bottom plot (whose relative height is defined as '1').

```r
p1 + p2 + plot_layout(ncol = 1, heights = c(3, 1))
```

![two plots one on top of the other of unequal heights](images/08_multiple_plots/08_dataviz_multiple_plots-3.png)

### Nesting plots

Finally, sometimes you want a more complicated layout. Patchwork can handle this too. To nest a plot within another plot, the formatting is slightly more complicated, you can use parentheses '()' or brackets '{}' around the plots you want to nest. 

For example, in the code below, plot `p4` is plotted first and the whole plot is defined to have one column. Then, plot `p1` is added. Finally,`p2` and `p3` are combined into a single column plot before this combined plot (p2 + p3) is nested into the overall plot. The brackets {} are placed carefully around the plots to determine the achieve the desired plotting format.


```r
p3 <- ggplot(mtcars) + geom_smooth(aes(disp, qsec))
p4 <- ggplot(mtcars) + geom_bar(aes(carb))

p4 + (
  p1 + (
    p2 +
    p3 +
    plot_layout(ncol = 1)
  )
) +
  plot_layout(ncol = 1)
```

![Nested Plots](images/08_multiple_plots/08_dataviz_multiple_plots-4.png)


### Additional operators 

So far we have only added plots to one another using '+'. While this operator can accomplish most multi-plotting goals, we will briefly highlight a few additional operators within `patchwork`.

#### `|` and `/`

If you are simply adding plots beside one another or on top of one another, this can be accomplished using `|` and `/`. `|` tells patchwork to put the plots next to one another from left to right. `/` tells patchwork you want those plots on top of each other. For example, below we see that `p1`, `p2`, and `p3` should all be next to one another. These are grouped together because of the parentheses. Then these three plots should all be atop `p4`.

```r
(p1 | p2 | p3) /
      p4
```

![Three plots together horizontally over another plot vertically](images/08_multiple_plots/08_dataviz_multiple_plots-5.png)

#### `&` and `*`

`ggpplot2` allows for flexibility in theme in many different ways, as demonstrated in a previous lesson. To apply the same theme to all plots in the multi-plot image, you will want to use `&`. Below you'll see that with the use of `&`, `theme_bw` has been applied to all the plots.

```r
p1 + (p2 + p3) + p4 + plot_layout(ncol = 1) & theme_bw()
```

![All four plots changed to theme_bw()](images/08_multiple_plots/08_dataviz_multiple_plots-6.png)

If you only wanted this theme to be applied to the plots in the current nesting level, you would use `*`.

```r
(p1 + (p2 + p3) + p4 + plot_layout(ncol = 1)) * theme_bw()
```

![Plots in main nesting level have theme_bw, but p2 and p3 remain unchanged](images/08_multiple_plots/08_dataviz_multiple_plots-7.png)

#### `-`

Thus far, we have only focused on adding plots together using `+`. There is also an `-` operator. Think of this as a hyphen, rather than as a subtraction sign, because we won't be removing any plots. This operator puts what is on the left and right side of the `-` on the same nesting level. In the code below, the overall plot layout defines that there should be one column. That means that `p2` and `p3` are on the same nesting level (because of the `-`). This forces `p1` and `p2` to be side by side. This operator is slightly less intuitive, and thus is included here for completeness but included at the end because you can likely compose all the multiplot images you need without fully understanding the `-` operator.

```r
p1 + p2 - p3 + plot_layout(ncol = 1)
```

![Using the - operator](images/08_multiple_plots/08_dataviz_multiple_plots-8.png)

### Additional Resources
[Patchwork GitHub](https://github.com/thomasp85/patchwork)

### Slides and Video

![Multiple Plots](https://www.youtube.com/watch?v=aosPI1awdVE)

* [Slides](https://docs.google.com/presentation/d/1pSJw_6hCq7iQOtpwwd76PSdlqAir9xkmWp44dYwr9CI/edit?usp=sharing)


{quiz, id: quiz_08_multiple_plots}

### Multiple Plots quiz

? If you had three plots (p1, p2, and p3) and used the code `p1 + p2 + p3`, how many columns would the resulting plot have?

a) 1
b) 2
C) 3
d) 4

? Which of these would NOT get you four plots of equal size with two on top and two on bottom?

a) (p1 + p2) + p3 + p4 + plot_layout(ncol = 2)
b) p1 + p2 + plot_layout(ncol = 2) + p3 + p4 
c) p1 + p2 + p3 + p4 + plot_layout(ncol = 2)
D) p1 + p2 + (p3 + p4) + plot_layout(ncol = 2)

? How many plots would have ggplot2 theme theme_bw() w/ this code: `((p1 + p2 + p3) + plot_layout(ncol = 1)) * theme_bw() + p4`? 

a) 1
b) 2 
C) 3
d) 4

{/quiz}
