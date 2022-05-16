# Saving Plots

While you'll frequently be generating R Markdown documents where figures are generated directly as the file is knit, it is nonetheless important to know how to save an image directly. This is helpful when you have to add plots into slide presentations (using Google Slides, for example) or to send a quick update to your team.

In this lesson, we'll discuss how to save plots you've generated in R within RStudio Cloud as images that you can share with others as you need.

### Image Types

There are a number of different image file formats that can be generated from R.  We will only discuss four of them here, but we'll list the other possible file formats in each of the following sections, so that you know what types of files can be generated from R.

In R, frequently, individuals tend to generate one of the following four file formats. Brief characteristics of each file format are summarized here. These are worth considering when deciding what type of image you want to generate:

* __JPEG__ - a popular file format that will **take up less space** on your computer due to how its compressed. Figures that are saved multiple times, however, will **lose quality each time they're saved**. These files have a **white background by default**.
* __PNG__ - a high-quality bitmap image file format that preserves its integrity over time. Due to this, these images will **take up more storage space**. The **background of these files is transparent**. There will be no white border around these images.  If magnified, pixels may be visible.
* __TIFF__ - a bitmap file format. TIFF files are not meant to compress but are meant to preserve quality over time. TIFF images can be edited using photo editors, such as Photoshop. Use this file format if you **intend to edit this image later**. If magnified, pixels may be visible.
* __PDF__ - a vector file format. This is most helpful if you want to plot **multiple images to a single file** or when you want to print your images, as they can be **scaled to any size without suffering from pixelation**.


![file format summary](https://docs.google.com/presentation/d/1O_10dR6Nb273S0bF-Xv3VCCHweagVzRJVv7HI1NPMBs/export/png?id=1O_10dR6Nb273S0bF-Xv3VCCHweagVzRJVv7HI1NPMBs&pageid=g3c02ec7cbb_0_0)

### Saving Plots: `ggsave()`

We've discussed how to generate plots using `ggplot2`, and here we will discuss how to save them using the convenient function `ggsave()`. By specifying the `plot` you want to save, the `filename` you want the file output to have and the `path`, or destination where you want this plot to be saved, you can quickly and easily save any plot generated in `ggplot2`. To save a different file format, you simply change the file extension in the `filename` argument. `ggsave()` will output plots in any of the following file formats: "eps", "ps", "tex" (pictex), "pdf", "jpeg", "tiff", "png", "bmp", "svg" or "wmf" (on Windows only).

For example, here we see how to save a plot in the "figures/exploratory_figures" directory. The code demonstrates how to save it both as a PNG and JPEG image.

```r
## generate plot
myplot <- ggplot(mtcars, aes(wt, mpg)) + geom_point()

## save plot as PNG
ggsave(plot = myplot, filename = "myplot.png", path = "figures/exploratory_figures")

## save plot as JPEG
ggsave(plot = myplot, filename = "myplot.jpeg", path = "figures/exploratory_figures")
```

There are additional arguments within `ggsave`. In particular, you will often want to adjust the size of your images. You can control the size of your image using the `height` and `width` arguments. Additionally, `ggsave()` allows you to specify the units of those height and width arguments as either inches ("in"), centimeters ("cm"), or millimeters ("mm").

For example, to increase the size of and overwrite the PNG image created above, you could use the following:

```r
## save plot as larger PNG
ggsave(plot = myplot, filename = "myplot.png", path = "figures/exploratory_figures", height = 9, width = 9, unit = c("in"))
```

### Alternative Approach

As `ggsave()` is an incredibly simple function,, we recommend that you use that to generate images. However, there may be times where you run into trouble saving an image or see someone else has saved an image in a different way. In addition to `ggsave()`, there are a number of graphics devices that you *can* use to save plots as images. We recommend you use `ggsave()`; however we want you to additionally be aware of an alternative way to generate image files.  

To utilize the graphics devices outside of `ggsave()`, you first call the graphics device with the appropriate function: `png()`, `jpeg()`, `pdf()`, or `tiff()`. Within this function call, you'll specify the path to and name of the file you'd like to save. You then print the image object. Once done, you always have to type `dev.off()` to finalize the image file generation.

For example, to generate a png, you would use the following:

```r
png("figures/exploratory_figures/myplot.png")
print(myplot)
dev.off()
```

To generate a JPEG, you would use this very similar syntax, but ensure that you change the initial function call to `jpeg` and the file extension to ".jpeg":

```r
jpeg("figures/exploratory_figures/myplot.jpeg")
print(myplot)
dev.off()
```

Similar to above, the `height`, `width` can again be specified, as above. For jpeg, bmp, and tiff files, `units` can also be specified (as either pixels ("px"), inches ("in"), centimeters ("cm"), or millimeters ("mm"). The default is pixels. When generating PDFs using `pdf()` there are additional arguments that can be viewed using `?pdf`; however, there is no `units` argument to be specified.

### Additional Resources

* [R Cookbook](http://www.cookbook-r.com/Graphs/Output_to_a_file/)  - Further reading on file formats in R

### Slides and Video

![Saving Plots](https://youtu.be/1z3m_9ZXp0M)

  * [Slides](https://docs.google.com/presentation/d/1O_10dR6Nb273S0bF-Xv3VCCHweagVzRJVv7HI1NPMBs/edit?usp=sharing)
