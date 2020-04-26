#!# Loading the tidyverse package (must do every time)
library(tidyverse)

#!# Load and Prep Data
#!# Set to your own working directory and have just your filename below.
gss <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/GSS_Enviro_2010.csv",
                na.strings=c("na","NA","-1","7","8","9","98","99")) %>%
  mutate(SEX=plyr::mapvalues(SEX,from=1:2,to=c("Male","Female")),
         RACE=plyr::mapvalues(RACE,from=1:3,to=c("White","Black","Other")),
         DEGREE=plyr::mapvalues(DEGREE,from=0:4,
           to=c("Less than HS","High School","Junior College","Bachelors","Graduate School")),
         GRNSOL = plyr::mapvalues(GRNSOL,from=0:5,
           to=c(NA_character_,"Very","Fairly","Neither","Not Very","Not At All")),
         GRNCON = plyr::mapvalues(GRNCON,from=0:5,
           to=c(NA_character_,"Not at All","Not Much","Neither","Somewhat","Very"))) %>%
  filter(!is.na(GRNSOL),!is.na(GRNCON))

#!# Controlling order of levels of factor variables (where order is important)
#!# Narrowing only to those variables of interest for the slides
gss <- gss %>%
  mutate(SEX=factor(SEX),RACE=factor(RACE,levels=c("White","Black","Other")),
         DEGREE=factor(DEGREE,levels=c("Less than HS","High School","Junior College",
                                       "Bachelors","Graduate School")),
         GRNSOL = factor(GRNSOL,levels=c("Not At All","Not Very","Neither","Fairly","Very")),
         GRNCON = factor(GRNCON,levels=c("Not at All","Not Much","Neither","Somewhat","Very"))) %>%
  select(SEX,DEGREE,GRNSOL)

head(gss)

#!# Declaring a color palette so I don't have to type this every time
clrs <- c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2")


#!# Bar Chart with Typical Modifications
b <- ggplot(data=gss, mapping=aes(x=GRNSOL)) +
  geom_bar(color="gray30",fill="gray30",alpha=0.75) +
  scale_x_discrete(name="Willingness to Pay") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

#!# Stacked Bar Chart (by Groups)
b <- ggplot(data=gss, mapping=aes(x=SEX,fill=GRNSOL)) +
  geom_bar(color="gray30",alpha=0.75) +
  scale_x_discrete(name="Sex of Respondent") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Willingness?",values=clrs) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

#!# Stacked Bar Chart 2
b <- ggplot(data=gss, mapping=aes(x=DEGREE,fill=GRNSOL)) +
  geom_bar(color="gray30",alpha=0.75) +
  scale_x_discrete(name="Highest Completed Degree") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Willingness?",values=clrs) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

#!# Side-by-Side Bar Chart
b <- ggplot(data=gss, mapping=aes(x=DEGREE,fill=GRNSOL)) +
  geom_bar(color="gray30",alpha=0.75,position="dodge") +
  scale_x_discrete(name="Highest Completed Degree") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Willingness?",values=clrs) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

#!# Flipping the Axes on the Side-by-Side Bar Chart
b +
  coord_flip()

#!# Bar Chart from Summarized Counts (only one variable)
gss_sum1 <- gss %>%
  group_by(GRNSOL) %>%
  summarize(freq=n())

b <- ggplot(data=gss_sum1, mapping=aes(x=GRNSOL,y=freq)) +
  geom_bar(stat="identity",color="gray30",fill="gray30",alpha=0.75) +
  scale_x_discrete(name="Willingness to Pay") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

#!# Bar Chart from Summarized Counts (two variables)
gss_sum2 <- gss %>%
  group_by(SEX,GRNSOL) %>%
  summarize(freq=n()) %>%
  ungroup()

b <- ggplot(data=gss_sum2,
            mapping=aes(x=SEX,y=freq,fill=GRNSOL)) +
  geom_bar(stat="identity",color="gray30",alpha=0.75) +
  scale_x_discrete(name="Sex of Respondent") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Willingness?",values=clrs) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

#!# Stacked Bar Chart of Percentages
gss_sum3 <- gss %>%
  group_by(SEX,GRNSOL) %>%
  summarize(freq=n()) %>%
  mutate(perc=freq/sum(freq)*100) %>%
  ungroup()

b <- ggplot(data=gss_sum3,
            mapping=aes(x=SEX,y=perc,fill=GRNSOL)) +
  geom_bar(stat="identity",color="gray30",alpha=0.75) +
  scale_x_discrete(name="Sex of Respondent") +
  scale_y_continuous(name="Percentage of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Willingness?",values=clrs) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

#!# Stacked Bar Chart of Percentages 2
gss_sum3 <- gss %>%
  group_by(DEGREE,GRNSOL) %>%
  summarize(freq=n()) %>%
  mutate(perc=freq/sum(freq)*100) %>%
  ungroup()

b <- ggplot(data=gss_sum3,
            mapping=aes(x=DEGREE,y=perc,fill=GRNSOL)) +
  geom_bar(stat="identity",color="gray30",alpha=0.75) +
  scale_x_discrete(name="Highest Degree Completed") +
  scale_y_continuous(name="Percentage of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Willingness?",values=clrs) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank()) +
  coord_flip()

# Script created at 2020-04-26 10:34:11
