#!# Loading the tidyverse package (must do every time)
library(tidyverse)

#!# Load and Prep Data

#!# Set to your own working directory and have just your filename below.
flbb <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/BlackBearsFL.csv") %>%
  rename(sex=SEX,
         age=AGE..yr.,
         length=BODY.LENGTH..cm.,
         weight=BODY.WEIGHT..kg.,
         chest=CHEST.GIRTH..cm.) %>%
  mutate(sex=plyr::mapvalues(sex,
                             from=c("FEMALE","MALE"),
                             to=c("Female","Male")),
         sex=factor(sex))

head(flbb)

h <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_histogram(binwidth=10,boundary=0,closed="left",
                 color="gray30",fill="gray30",alpha=0.25) +
  scale_x_continuous(name="Weight (kg)",breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Frequency of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())
h

h <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_histogram(binwidth=10,boundary=0,closed="left",
                 color="gray30",fill="gray30",alpha=0.25) +
  scale_x_continuous(name="Weight (kg)",breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Frequency of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())
h

#!# A Mostly Default Histogram

p <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_histogram() +
  scale_y_continuous(name="Frequency of Bears") +
  scale_x_continuous(name="Weight (kg)",breaks=seq(0,250,25)) +
  theme_bw()

#!# DEREK ... delete this in the script

p <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_histogram(
    color="gray30", #BREAK2
    fill="gray30", #BREAK3
    alpha=0.25, #BREAK4
    binwidth=10, #BREAK5
    boundary=0,closed="left" #BREAK6
  ) +
  scale_y_continuous(
    name="Frequency of Bears",
    expand=expansion(mult=c(0,0.05)) #BREAK7
  ) +
  scale_x_continuous(
    name="Weight (kg)",breaks=seq(0,250,25),
    expand=expansion(mult=c(0,0)) #BREAK8
  ) +
  theme_bw()

#!# Histogram with Typical Modifications

p <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_histogram(color="gray30",fill="gray30",alpha=0.25,
                 binwidth=10,boundary=0,closed="left") +
  scale_y_continuous(name="Frequency of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  scale_x_continuous(name="Weight (kg)",breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  theme_bw() + #BREAK
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())  

#!# DEREK ... delete this for the script

p <- ggplot(data=flbb,mapping=aes(
              x=weight,
              color=sex, #BREAK2
              fill=sex #BREAK3
            )) +
  geom_histogram(binwidth=10,boundary=0,closed="left",
                 alpha=0.25 #BREAK4
  ) +
  scale_y_continuous(name="Frequency of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  scale_x_continuous(name="Weight (kg)",breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

#!# Stacked Histogram with Modified Colors

p <- ggplot(data=flbb,
            mapping=aes(x=weight,color=sex,fill=sex)) +
  geom_histogram(binwidth=10,boundary=0,closed="left",
                 alpha=0.25) +
  scale_y_continuous(name="Frequency of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  scale_x_continuous(name="Weight (kg)",breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank()) + #BREAK
  scale_color_manual(values=c("red","blue")) + #BREAK
  scale_fill_manual(values=c("red","blue"))

h2 <- p # for boxplots later

d <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_density(color="gray30",fill="gray30",alpha=0.25) +
  scale_x_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Relative Density of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())
h <- h + scale_x_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0)))
d / h

#!# Density Plot with Typical Modifications

p <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_density(
    color="gray30", #BREAK2
    fill="gray30", #BREAK3
    alpha=0.25 #BREAK4
  ) +
  scale_x_continuous(
    name="Weight (kg)",
    breaks=seq(0,250,25),expand=expansion(mult=c(0,0)),
    limits=c(0,250) #BREAK5
  ) +
  scale_y_continuous(name="Relative Density of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

#!# Density Plot ... Adjusting the Smoothness

p <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_density(color="gray30",fill="gray30",alpha=0.25,
               adjust=0.25#BREAK2
  ) +
  scale_x_continuous(name="Weight (kg)",breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0)),
                     limits=c(0,250)) +
  scale_y_continuous(name="Relative Density of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

#!# Density Plots by Groups 

p <- ggplot(data=flbb, mapping=aes(
  x=weight,
  color=sex, #BREAK2
  fill=sex #BREAK3
  )) +
  geom_density(alpha=0.25) +
  scale_x_continuous(name="Weight (kg)",
                     breaks=seq(0,250,25),limits=c(0,250),
                     expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Relative Density of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  scale_color_manual(values=c("red","blue")) + #BREAK4
  scale_fill_manual(values=c("red","blue")) + #BREAK5
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

b <- ggplot(data=flbb, mapping=aes(x=sex,y=weight,color=sex,fill=sex)) +
  geom_boxplot(alpha=0.25) +
  scale_x_discrete(name="Sex") +
  scale_y_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  coord_flip() +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())
b / h2 & theme(legend.position="none")

#!# Boxplot with Typical Modifications

p <- ggplot(data=flbb, mapping=aes(x=sex,y=weight)) +
  geom_boxplot(fill="gray30",alpha=0.25) +
  scale_x_discrete(name="Sex") +
  scale_y_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  theme_bw()

#!# Boxplot with Colors by Group

p <- ggplot(data=flbb, mapping=aes(
    x=sex,y=weight,
    color=sex,fill=sex #BREAK2
  )) +
  geom_boxplot(alpha=0.25) +
  scale_x_discrete(name="Sex") +
  scale_y_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) + #BREAK3
  theme_bw() +
  theme(legend.position="none") #BREAK4

v <- ggplot(data=flbb, mapping=aes(x=sex,y=weight,color=sex,fill=sex)) +
  geom_violin(alpha=0.25,trim=FALSE) +
  scale_x_discrete(name="Sex") +
  scale_y_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  coord_flip() +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

d2 <- ggplot(data=flbb, mapping=aes(x=weight,color=sex,fill=sex)) +
  geom_density(alpha=0.25) +
  scale_x_continuous(name="Weight (kg)",
                     breaks=seq(0,250,25),limits=c(0,250),
                     expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Relative Density of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

v / d2 & theme(legend.position="none")

#!# Violin Plot with Typical Modifications

p <- ggplot(data=flbb, mapping=aes(x=sex,y=weight)) +
  geom_violin(fill="gray30",alpha=0.25,trim=FALSE) +
  scale_x_discrete(name="Sex") +
  scale_y_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  theme_bw()

#!# Violin Plot with Individual Points

p <- ggplot(data=flbb, mapping=aes(x=sex,y=weight)) +
  geom_violin(fill="gray30",alpha=0.25,trim=FALSE) +
  scale_x_discrete(name="Sex") +
  scale_y_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  theme_bw() + #BREAK
  geom_jitter(width=0.05,height=0,alpha=0.25)


# Script created at 2020-05-04 08:29:22
