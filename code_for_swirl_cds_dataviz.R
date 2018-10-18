#L02

# Q01
ggplot(midwest, aes(x=percbelowpoverty,y=percadultpoverty)) + geom_point()
ggplot(midwest) + geom_point(aes(x=percbelowpoverty,y=percadultpoverty))
ggplot(midwest, aes(percbelowpoverty,percadultpoverty)) + geom_point()
ggplot(midwest) + geom_point(aes(percbelowpoverty,percadultpoverty))
ggplot(data = midwest, aes(x=percbelowpoverty,y=percadultpoverty)) + geom_point()
ggplot(data = midwest) + geom_point(aes(x=percbelowpoverty,y=percadultpoverty))
ggplot(data = midwest, aes(percbelowpoverty,percadultpoverty)) + geom_point()
ggplot(data = midwest) + geom_point(aes(percbelowpoverty,percadultpoverty))

ggplot(midwest) + geom_point(aes(x=poptotal,y=popdensity))
ggplot(midwest,aes(x=poptotal,y=popdensity)) + geom_point()
ggplot(midwest) + geom_point(aes(poptotal,popdensity))
ggplot(midwest,aes(poptotal,popdensity)) + geom_point()
ggplot(data = midwest) + geom_point(aes(x=poptotal,y=popdensity))
ggplot(data = midwest,aes(x=poptotal,y=popdensity)) + geom_point()
ggplot(data = midwest) + geom_point(aes(poptotal,popdensity))
ggplot(data = midwest,aes(poptotal,popdensity)) + geom_point()

# Q02
ggplot(midwest, aes(percbelowpoverty,percadultpoverty)) + geom_point(color="dodgerblue")
ggplot(midwest, aes(x=percbelowpoverty,y=percadultpoverty)) + geom_point(color="dodgerblue")
ggplot(midwest) + geom_point(aes(x=percbelowpoverty,y=percadultpoverty),color="dodgerblue")
ggplot(midwest) + geom_point(aes(percbelowpoverty,percadultpoverty),color="dodgerblue")
ggplot(data = midwest, aes(percbelowpoverty,percadultpoverty)) + geom_point(color="dodgerblue")
ggplot(data = midwest, aes(x=percbelowpoverty,y=percadultpoverty)) + geom_point(color="dodgerblue")
ggplot(data = midwest) + geom_point(aes(x=percbelowpoverty,y=percadultpoverty),color="dodgerblue")
ggplot(data = midwest) + geom_point(aes(percbelowpoverty,percadultpoverty),color="dodgerblue")


ggplot(midwest, aes(x=percbelowpoverty,y=percadultpoverty)) + geom_point(shape=2)
ggplot(midwest) + geom_point(aes(x=percbelowpoverty,y=percadultpoverty),shape=2)
ggplot(midwest, aes(percbelowpoverty,percadultpoverty)) + geom_point(shape=2)
ggplot(midwest) + geom_point(aes(percbelowpoverty,percadultpoverty),shape=2)
ggplot(data = midwest, aes(x=percbelowpoverty,y=percadultpoverty)) + geom_point(shape=2)
ggplot(data = midwest) + geom_point(aes(x=percbelowpoverty,y=percadultpoverty),shape=2)
ggplot(data = midwest, aes(percbelowpoverty,percadultpoverty)) + geom_point(shape=2)
ggplot(data = midwest) + geom_point(aes(percbelowpoverty,percadultpoverty),shape=2)


# Q03
ggplot(midwest, aes(percbelowpoverty)) + geom_histogram()
ggplot(midwest) + geom_histogram(aes(percbelowpoverty))
ggplot(midwest, aes(x=percbelowpoverty)) + geom_histogram()
ggplot(midwest) + geom_histogram(aes(x=percbelowpoverty))
ggplot(data = midwest, aes(percbelowpoverty)) + geom_histogram()
ggplot(data = midwest) + geom_histogram(aes(percbelowpoverty))
ggplot(data = midwest, aes(x=percbelowpoverty)) + geom_histogram()
ggplot(data = midwest) + geom_histogram(aes(x=percbelowpoverty))

('ggplot(midwest, aes(percbelowpoverty)) + geom_histogram()', 'ggplot(midwest) + geom_histogram(aes(percbelowpoverty))', 'ggplot(midwest, aes(x=percbelowpoverty)) + geom_histogram()', 'ggplot(midwest) + geom_histogram(aes(x=percbelowpoverty))', 'ggplot(data = midwest, aes(percbelowpoverty)) + geom_histogram()', 'ggplot(data = midwest) + geom_histogram(aes(percbelowpoverty))', 'ggplot(data = midwest, aes(x=percbelowpoverty)) + geom_histogram()', 'ggplot(data = midwest) + geom_histogram(aes(x=percbelowpoverty))')

# Q04
ggplot(midwest, aes(percbelowpoverty)) + geom_histogram(color="gray8")
ggplot(midwest) + geom_histogram(aes(percbelowpoverty), color="gray8")
ggplot(midwest, aes(x=percbelowpoverty)) + geom_histogram(color="gray8")
ggplot(midwest) + geom_histogram(aes(x=percbelowpoverty), color="gray8")
ggplot(data = midwest, aes(percbelowpoverty)) + geom_histogram(color="gray8")
ggplot(data = midwest) + geom_histogram(aes(percbelowpoverty), color="gray8")
ggplot(data = midwest, aes(x=percbelowpoverty)) + geom_histogram(color="gray8")
ggplot(data = midwest) + geom_histogram(aes(x=percbelowpoverty), color="gray8")

('ggplot(midwest, aes(percbelowpoverty)) + geom_histogram(color="gray8")','ggplot(midwest) + geom_histogram(aes(percbelowpoverty), color="gray8")','ggplot(midwest, aes(x=percbelowpoverty)) + geom_histogram(color="gray8")','ggplot(midwest) + geom_histogram(aes(x=percbelowpoverty), color="gray8")','ggplot(data = midwest, aes(percbelowpoverty)) + geom_histogram(color="gray8")','ggplot(data = midwest) + geom_histogram(aes(percbelowpoverty), color="gray8")','ggplot(data = midwest, aes(x=percbelowpoverty)) + geom_histogram(color="gray8")','ggplot(data = midwest) + geom_histogram(aes(x=percbelowpoverty), color="gray8")')

ggplot(midwest, aes(percbelowpoverty)) + geom_histogram(color="gray8", bins=40)
ggplot(midwest) + geom_histogram(aes(percbelowpoverty), color="gray8", bins=40)
ggplot(midwest, aes(x=percbelowpoverty)) + geom_histogram(color="gray8", bins=40)
ggplot(midwest) + geom_histogram(aes(x=percbelowpoverty), color="gray8", bins=40)
ggplot(data = midwest, aes(percbelowpoverty)) + geom_histogram(color="gray8", bins=40)
ggplot(data = midwest) + geom_histogram(aes(percbelowpoverty), color="gray8", bins=40)
ggplot(data = midwest, aes(x=percbelowpoverty)) + geom_histogram(color="gray8", bins=40)
ggplot(data = midwest) + geom_histogram(aes(x=percbelowpoverty), color="gray8", bins=40)

('ggplot(midwest, aes(percbelowpoverty)) + geom_histogram(color="gray8", bins=40)', 'ggplot(midwest) + geom_histogram(aes(percbelowpoverty), color="gray8", bins=40)','ggplot(midwest, aes(x=percbelowpoverty)) + geom_histogram(color="gray8", bins=40)','ggplot(midwest) + geom_histogram(aes(x=percbelowpoverty), color="gray8", bins=40)','ggplot(data = midwest, aes(percbelowpoverty)) + geom_histogram(color="gray8", bins=40)','ggplot(data = midwest) + geom_histogram(aes(percbelowpoverty), color="gray8", bins=40)','ggplot(data = midwest, aes(x=percbelowpoverty)) + geom_histogram(color="gray8", bins=40)','ggplot(data = midwest) + geom_histogram(aes(x=percbelowpoverty), color="gray8", bins=40)')

# Q05

ggplot(midwest,aes(state)) + geom_bar()
ggplot(midwest,aes(x=state)) + geom_bar()
ggplot(midwest) + geom_bar(aes(state))
ggplot(midwest) + geom_bar(aes(x=state))
ggplot(data = midwest,aes(state)) + geom_bar()
ggplot(data = midwest,aes(x=state)) + geom_bar()
ggplot(data = midwest) + geom_bar(aes(state))
ggplot(data = midwest) + geom_bar(aes(x=state))

('ggplot(midwest,aes(state)) + geom_bar()','ggplot(midwest,aes(x=state)) + geom_bar()','ggplot(midwest) + geom_bar(aes(state))','ggplot(midwest) + geom_bar(aes(x=state))','ggplot(data = midwest,aes(state)) + geom_bar()','ggplot(data = midwest,aes(x=state)) + geom_bar()','ggplot(data = midwest) + geom_bar(aes(state))','ggplot(data = midwest) + geom_bar(aes(x=state))')

# Q06

ggplot(midwest,aes(x=state)) + geom_bar() + facet_wrap(~inmetro)
ggplot(midwest,aes(state)) + geom_bar() + facet_wrap(~inmetro)
ggplot(midwest) + geom_bar(aes(x=state)) + facet_wrap(~inmetro)
ggplot(midwest) + geom_bar(aes(state)) + facet_wrap(~inmetro)
ggplot(data = midwest,aes(x=state)) + geom_bar() + facet_wrap(~inmetro)
ggplot(data = midwest,aes(state)) + geom_bar() + facet_wrap(~inmetro)
ggplot(data = midwest) + geom_bar(aes(x=state)) + facet_wrap(~inmetro)
ggplot(data = midwest) + geom_bar(aes(state)) + facet_wrap(~inmetro)

('ggplot(midwest,aes(x=state)) + geom_bar() + facet_wrap(~inmetro)','ggplot(midwest,aes(state)) + geom_bar() + facet_wrap(~inmetro)','ggplot(midwest) + geom_bar(aes(x=state)) + facet_wrap(~inmetro)','ggplot(midwest) + geom_bar(aes(state)) + facet_wrap(~inmetro)','ggplot(data = midwest,aes(x=state)) + geom_bar() + facet_wrap(~inmetro)','ggplot(data = midwest,aes(state)) + geom_bar() + facet_wrap(~inmetro)','ggplot(data = midwest) + geom_bar(aes(x=state)) + facet_wrap(~inmetro)','ggplot(data = midwest) + geom_bar(aes(state)) + facet_wrap(~inmetro)')


# Q07
ggplot(midwest,aes(x=state, y=perchsd)) + geom_boxplot() 
ggplot(midwest,aes(state, perchsd)) + geom_boxplot() 
ggplot(midwest) + geom_boxplot(aes(x=state, y=perchsd)) 
ggplot(midwest) + geom_boxplot(aes(state, perchsd)) 
ggplot(data = midwest,aes(x=state, y=perchsd)) + geom_boxplot() 
ggplot(data = midwest,aes(state, perchsd)) + geom_boxplot() 
ggplot(data = midwest) + geom_boxplot(aes(x=state, y=perchsd)) 
ggplot(data = midwest) + geom_boxplot(aes(state, perchsd))

('ggplot(midwest,aes(x=state, y=perchsd)) + geom_boxplot()','ggplot(midwest,aes(state, perchsd)) + geom_boxplot()','ggplot(midwest) + geom_boxplot(aes(x=state, y=perchsd))','ggplot(midwest) + geom_boxplot(aes(state, perchsd))','ggplot(data = midwest,aes(x=state, y=perchsd)) + geom_boxplot()','ggplot(data = midwest,aes(state, perchsd)) + geom_boxplot()','ggplot(data = midwest) + geom_boxplot(aes(x=state, y=perchsd))','ggplot(data = midwest) + geom_boxplot(aes(state, perchsd))')

# Q08
ggplot(midwest,aes(x=state, y=perchsd)) + geom_boxplot(fill="gray80") 
ggplot(midwest,aes(state, perchsd)) + geom_boxplot(fill="gray80") 
ggplot(midwest) + geom_boxplot(aes(x=state, y=perchsd),fill="gray80") 
ggplot(midwest) + geom_boxplot(aes(state, perchsd),fill="gray80") 
ggplot(data = midwest,aes(x=state, y=perchsd)) + geom_boxplot(fill="gray80") 
ggplot(data = midwest,aes(state, perchsd)) + geom_boxplot(fill="gray80") 
ggplot(data = midwest) + geom_boxplot(aes(x=state, y=perchsd),fill="gray80") 
ggplot(data = midwest) + geom_boxplot(aes(state, perchsd),fill="gray80")

('ggplot(midwest,aes(x=state, y=perchsd)) + geom_boxplot(fill="gray80")','ggplot(midwest,aes(state, perchsd)) + geom_boxplot(fill="gray80")','ggplot(midwest) + geom_boxplot(aes(x=state, y=perchsd),fill="gray80")','ggplot(midwest) + geom_boxplot(aes(state, perchsd),fill="gray80")','ggplot(data = midwest,aes(x=state, y=perchsd)) + geom_boxplot(fill="gray80")','ggplot(data = midwest,aes(state, perchsd)) + geom_boxplot(fill="gray80")', 'ggplot(data = midwest) + geom_boxplot(aes(x=state, y=perchsd),fill="gray80")','ggplot(data = midwest) + geom_boxplot(aes(state, perchsd),fill="gray80")')

#L03

# Q01
# barchart with colored fill on second variable
ggplot(mpg) + geom_bar(aes(x=manufacturer, fill=class))
ggplot(mpg) + geom_bar(aes(manufacturer, fill=class))
ggplot(data=mpg) + geom_bar(aes(x=manufacturer, fill=class))
ggplot(data=mpg) + geom_bar(aes(manufacturer, fill=class))

ggplot(mpg,aes(x=manufacturer,fill=class)) + geom_bar()
ggplot(mpg,aes(manufacturer,fill=class)) + geom_bar()
ggplot(data = mpg,aes(x=manufacturer,fill=class)) + geom_bar()
ggplot(data= mpg,aes(manufacturer,fill=class)) + geom_bar()

('ggplot(mpg) + geom_bar(aes(x=manufacturer, fill=class))','ggplot(mpg) + geom_bar(aes(manufacturer, fill=class))', 'ggplot(data=mpg) + geom_bar(aes(manufacturer, fill=class))', 'ggplot(mpg,aes(x=manufacturer,fill=class)) + geom_bar()','ggplot(mpg,aes(manufacturer,fill=class)) + geom_bar()','ggplot(data = mpg,aes(x=manufacturer,fill=class)) + geom_bar()','ggplot(data= mpg,aes(manufacturer,fill=class)) + geom_bar()')

# Q02

# barchart position = dodge
df <- mpg %>% filter(manufacturer %in% c("audi", "dodge","toyota","volkswagen"))


ggplot(data = DATAFRAME) + geom_bar(aes(x = VARIABLE, fill = VARIABLE),________)

ggplot(data = df) + geom_bar(aes(x=manufacturer, fill=trans), position="dodge")

# Q03
# barchart with title (labs)
ggplot(df) + geom_bar(aes(x=manufacturer, fill=trans), position="dodge") + labs(title="Transmissions by Manufacturer")

('ggplot(df) + geom_bar(aes(x=manufacturer, fill=trans), position="dodge") + labs(title="Transmissions by Manufacturer")','ggplot(df) + geom_bar(aes(x=manufacturer, fill=trans), position="dodge") + ggtitle("Transmissions by Manufacturer")')

# Q04
p<-ggplot(df) + geom_bar(aes(x=manufacturer, fill=trans), position="dodge") + labs(title="Transmissions by Manufacturer")
# themes
ggplot(df) + geom_bar(aes(x=manufacturer, fill=trans), position="dodge") + labs(title="Transmissions by Manufacturer") + theme_bw()

# Q05

# increase axis text size (theme)
ggplot(df) + geom_bar(aes(x=manufacturer, fill=trans), position="dodge") + labs(title="Transmissions by Manufacturer") + theme_bw() + theme(axis.text = element_text(size =14))

# Q06

# coord_flip()

ggplot(df) + geom_bar(aes(x=manufacturer, fill=trans), position="dodge") + labs(title="Transmissions by Manufacturer") + theme_bw() + theme(axis.text = element_text(size =14)) + coord_flip()

#L05

ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

# Q01
# increase line thickness

ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line(size=1.5)


# Q02
# specify colors
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line(size=1.5, color = "red3" ) 

# Q03
# custom axis labels 
p <- ggplot(data = economics, aes(x = date, y = unemploy)) + 
  geom_line(size=1.5, color = "red3") 

p + ylab("unemployment")
p + labs(y ="unemployment")

# Q04
# Add annotation
economics <- economics %>% mutate(date=ymd(date))
p <- ggplot(data = economics, aes(x = date, y = unemploy, color = "red3" )) + 
  geom_line(size=1.5, color = "red3") + labs(y ="unemployment")

p + annotate("text", x = ymd("2005-01-01"), y = 13900, label = "Unemployment \n peaked \n in 2010")

p + annotate("text", x = XCOORD, y = YCOORD, label = LABEL)

#L07

library(dplyr)
library(knitr)
library(kableExtra)


#Q01
df <- midwest %>% 
  group_by(state)
  
 df <- df %>% summarize(poptotal = mean(poptotal), perchsd = mean(perchsd),percollege = mean(percollege)) 
#Q02
 kable(df) %>% kable_styling("striped")

#Q03
kable(df, digits=0) %>%
  kable_styling("striped")

Q04
kable(df, digits=0, caption = "Population and Education Rates in the Midwest") %>%
  kable_styling("striped")
