# Data Visualization Project

Throughout this course set, we'll have a number of projects for you to complete. This is the second project of the course set. All of these will be included as Exercises. This means they will *not* be required to pass the course and receive your certificate; however, completing them will *really* help to improve your understanding of the material covered and to ensure that you've begun to master the skills needed to be a data scientist.

In each project, we'll aim to get you started and to ask questions that will help guide you through the project. But, we'll intentionally leave pieces out where you have to figure out what needs to be done. 

This project will require you to:

* carry out an exploratory data analysis
* wrangle data
* generate exploratory plots
* generate explanatory plots

You can access the project by going to the exercise accompanying this lesson.

{exercise, id: project_dataviz}

### Data Visualization Project

Data Visualization is an incredibly important skill for a data scientitst. Being able to generate exploratory visualizations that help you understand the data and explanatory visualizations so that your findings 

As such, this exercise has been generated to practice your, GitHub, terminal navigation, RStudio, and data wrangling skills.

### GitHub Setup

To get started, you'll want to go to GitHub and start a new repository:

- Call this repository `dataviz_project`. 
- Add a short description
- Check the box to "Initialize this repository with a README. 
- Click `Create Repository`

Once the repository has been created, Click on `Clone or download` and copy the "Clone with HTTPS" link provided. You'll use this to clone your repo in RStudio Cloud.

**Note**: If you're stuck on this, these steps were covered in detail in an earlier course: [Version Control](https://leanpub.com/universities/courses/jhu/version-control). Refer to the materials in this course if you're stuck on this part of the project.

### RStudio Cloud Setup

- Go to the [Data Visualization Project Workspace on RStudio Cloud](ADD LINK) 
- Click on the "Projects" tab at the top of the workspace
- Make a copy of the project: `dataviz_project`

In this project you should see a `dataviz_project.Rmd ` file. You'll use this to get started working on your project!

*Note*: If you try to Knit this document at this time, you *will* get an error because there is code in this document that has to be edited (by you!) before it will be able to successfully knit!

To start using version control, you'll want to clone the GitHub repository you just created into this workspace. To do so, go to the Terminal and clone your project into this workspace.

A new directory with the name of your GitHub repository should now be viewable in the Files tab of RStudio Cloud. You are now set up to track your project with git.

### Data Science Project Setup

As discussed previously, you'll want all your data science projects you be organized from the very beginning. Let's do that now!

First, use `cd` to get yourself into the directory of your GitHub Project.  

Once in the correct directory, use `mkdir` in the terminal to create folders with the following structure:

- data/
  - raw_data/
  - tidy_data/
- code/
  - raw_code/
  - final_code/
- figures/
  - exploratory_figures/
  - explanatory_figures/
- products/
  - writing/

Now that your directories are set up you'll want to use the Terminal (or 'More' drop-down menu in the Files tab) to move (`mv`) the `dataviz_project.Rmd ` file into code/raw_code and the two .csv files in data/raw_data into the data/raw_data directory in *your* version controlled repository. This ensures that your code file and raw data are in the correct directory.

Once the .Rmd document is in the correct folder, you'll want to **change the author of this document** to your name at the top of the .Rmd document (in the YAML). Save this change before moving to the next step.

**Note**: If you're stuck on this, these steps were covered in detail in an earlier course: [Organizing Data Science Projects](https://leanpub.com/universities/courses/jhu/organizingdatascienceprojects). Refer to the materials in this course if you're stuck on this part of the project.

### Pushing to GitHub

You'll want to save changes to your project regularly by pushing them to GitHub. Now that you've got your file structure set up and have added a code file (.Rmd) and two raw data files (.csv), it's a good time to stage, commit, and push these changes to GitHub. Do so now, and then take a long on GitHub to see the changes on their website!

**Note**: If you're stuck on this, these steps were covered in detail in an earlier course: [Version Control](https://leanpub.com/universities/courses/jhu/version-control). Refer to the materials in this course if you're stuck on this part of the project.

## Part 1: Exploratory Data Analysis

The first part of the project will guide you through a few data wrangling steps to get the data in a usable format before generating a number of exploratory plots.

### The Data

The data we'll be using for this part of the project were downloaded from [kaggle](https://www.kaggle.com/aaronschlegel/seattle-pet-licenses/data), and include information about "pet licenses issued by the Seattle Animal Shelter between 2005 and early 2017." We'll be exploring these data and generating a few exploratory plots in the first part of the project.

To load the data in, run the code in the `pet-data` code chunk to create an object called `pets`. 


### Explore the Data

Once the data have been read in, explore the data, adding your code to `dataviz_project.Rmd`, and then answer the following questions:

? How many pet licenses are included in the dataset?

! 66042 ; 66,042

? How many unique pet names are included in the dataset (`animal_s_name`)

! 15796 ; 15,796

? How many different species are included in this dataset (`species`)? 

! 3

{choose-answers: 4}
? Which of these species is not included in the dataset?

C) Reptile
C) Bird
C) Primate
o) Cat
o) Dog
o) Livestock

Now that you have a handle on the data, let's start to generate some exploratory plots!


### Visualize the Data

To visualize the data, we'll first guide you through a few code chunks that have partial code. After walking through these code chunks, you'll be prompted 

#### Bar Chart 

Move on to the code chunk `visualize-pets`.

Here you will see comments with partial code underneath of them. For example, the first plot you'll want to generate will be using the comment  from the partial code: 

```r
## visual breakdown of how many of each species 
## are included in the dataset
ggplot(DATASET) +
  geom_bar(aes(x=VARIABLE))
```
Here, you'll have to change `DATASET` and `VARIABLE` in the code to the appropriate dataset and variable name in order to generate an exploratory plot. 

Feel free to customize your plots further using what you've learned about `ggplot2`. 

? Are there more dogs or cat licenses in this datset?

A) Dog
b) Cat

{choose-answers: 4}
? Approximately how many cat licenses are in this dataset?

C) 23,000
o) 10,000
o) 60,000
o) 40,000
o) 100,000
o) 100

#### Cat Table: `pet-cat-table`

After generating this first bar chart, move onto the code chunk `pet-cat-table`. Here you'll see the following partial code:

```r
## Table: Most frequent Cat Name 
DATASET %>% 
  filter(species=="SPECIES",VARIABLE != "") %>%
  group_by(VARIABLE) %>% 
  summarise(n=n()) %>% 
  arrange(-n) %>%
  top_n(n=10) %>%
  kable(., caption = "Top 10 Cat Names in Seattle")
```
Here, you will need to replace `DATASET`, `"SPECIES"`, and `VARIABLE` (in two places) in order to get this code to run. Your table at the end should have information about the top 10 most frequent cat names

{case-sensitive: false}
? What is the most common cat name?

! Lucy

#### Dog Table

Having successfully generated this table, move onto the `pet-dog-table` code chunk. There is no code in here. You'll need to put all the necessary code in this code chunk! Here, the goal is to create a similar table to what we just created; however, this should contain the 10 most frequent dog names, rather than cat names.

{case-sensitive: false}
? What is the most common dog name?

! Lucy

#### Line Chart

The last guided exploratory visualization you'll see is in the code chunk `pet-licenses`. Here, the code to create two new columns has been provided in full. You'll use the column `ym`, which creates a "year-month" variable, to generate your plot:

You will, however, have to edit the partial code after `## how the number of licenses recorded has changed over time`. Here, you'll need to add the appropriate function_names to accomplish what is stated in the comment above, and you'll need to fill in the appropriate variable wherever you see `VARIABLE`. Finally, where you see `geom_GEOM`, change "GEOM" to the appropriate geom specified in the comment above.
 
```r
## add date and ym columns
pets <- pets %>%  
  mutate(date =  lubridate::ymd_hms(license_issue_date),
         ym = as.yearmon(pets$date, "%y%m"))

## how the number of licenses recorded has changed over time
pets %>%
  ## group by yearmonth (`ym`)
  function_name(VARIABLE) %>% 
  ## count number within each group
  function_name(n=n()) %>%
  ggplot(., aes(VARIABLE, n)) + 
  ## geom name for line chart
  geom_GEOM() +
  scale_x_yearmon() + 
  xlab("") + 
  ylab("Number of licenses")
```
? What does the function `ymd_hms()` accomplish?

! Converts `license_issue_date` to a date-time object

? What geom did you specify to generate a line chart?

! geom_line

? In what year do se see a huge jump in the number of pet licenses?

! 2015

#### Create Your Own Explanatory Plot

After successfully generating two figures and two tables, it's time for you to generate your own exploratory plot. Explore the data and generate an additional exploratory plot that helps you better understand the data in this dataset. Included the code for this in the `pet-plot` code chunk.

### Part 2: Explanatory Data Analysis

#### The Data

#### Wrangle the Data

#### Visualize the Data


#### Add Markdown Text to .Rmd

Before finalizing your project you'll want be sure there are **comments in your code chunks** and **text outside of your code chunks** to explain what you're doing in each code chunk. These explanations are incredibly helpful for someone who doesn't code or someone unfamiliar to your project.

**Note**: If you're stuck on this, these steps were covered in detail in an earlier course: [Introduction to R](https://leanpub.com/universities/courses/jhu/introduction-to-r). Refer to the R Markdown lesson in this course if you're stuck on this part (or the next part) of the project.

#### Knit your R Markdown Document

Last but not least, you'll want to Knit your .Rmd document into an HTML document. If you get an error, take a look at what the error says and edit your .Rmd document. Then, try to Knit again! Troubleshooting these error messages will teach you a lot about coding in R.


#### Final `push` to GitHub

Now that you've finalized your project, you'll do one final push to GitHub. add, commit, and push your work to GitHub. Navigate to your GitHub repository, and answer the final question below! 

**Note**: If you're stuck on this, these steps were covered in detail in an earlier course: [Version Control](https://leanpub.com/universities/courses/jhu/version-control). Refer to the materials in this course if you're stuck on this part of the project.


? Submit the URL to your `dataviz_project` GitHub repository below.

! dataviz_project

**Congrats on finishing your Data Visualization Project**

{/exercise}

