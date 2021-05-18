library(tidyverse)

#!# Set to your own working directory and have just your filename below.
mlb <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/MLB19_Batting.csv",
                stringsAsFactors=FALSE) %>%
  select(Name,Age,Lg,G,AB,H,HR,RBI,BB,BA) %>%
  filter(Lg!="MLB",AB>200) %>%  # >200 at-bats in one league
  top_n(n=100,wt=BA) %>%        # players in top 100 by batting average
  mutate(Age_grp=case_when(     # create age groups
    Age < 24 ~ "<24 yrs",
    Age < 30 ~ "24-30 yrs",
    TRUE ~ ">30 yrs"),
    Age_grp=factor(Age_grp,levels=c("<24 yrs","24-30 yrs",">30 yrs")),
    Lg=factor(Lg))
str(mlb)

ages1 <- ggplot(data=mlb,mapping=aes(x=Age_grp)) +
  geom_bar(color="gray30",fill="wheat") +
  scale_x_discrete(name="Age Group") +
  scale_y_continuous(name="Frequency of Players",expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
ages1

lgage1 <- ggplot(data=mlb,mapping=aes(x=Lg,fill=Age_grp)) +
  geom_bar(color="gray30",alpha=0.7) +
  scale_x_discrete(name="League") +
  scale_y_continuous(name="Frequency of Players",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Age Group",values=c("#E69F00","#0072B2","#CC79A7")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
lgage1

lgage2 <- ggplot(data=mlb,mapping=aes(x=Lg,fill=Age_grp)) +
  geom_bar(position="dodge",color="gray30",alpha=0.7) +
  scale_x_discrete(name="League") +
  scale_y_continuous(name="Frequency of Players",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Age Group",values=c("#E69F00","#0072B2","#CC79A7")) +
  coord_flip() +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
lgage2

sum1 <- mlb %>%
  group_by(Age_grp) %>%
  summarize(freq=n()) %>%
  ungroup()

age1a <- ggplot(data=sum1,mapping=aes(x=Age_grp,y=freq)) +
  geom_bar(stat="identity",color="gray30",fill="wheat") +
  scale_x_discrete(name="Age Group") +
  scale_y_continuous(name="Frequency of Players",expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
age1a

sum2 <- mlb %>%
  group_by(Lg,Age_grp) %>%
  summarize(freq=n()) %>%
  mutate(perc=freq/sum(freq)*100) %>%
  ungroup()
  
lgage3 <- ggplot(data=sum2,mapping=aes(x=Lg,y=freq,fill=Age_grp)) +
  geom_bar(stat="identity",color="gray30",alpha=0.7) +
  scale_x_discrete(name="League") +
  scale_y_continuous(name="Frequency of Players",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Age Group",values=c("#E69F00","#0072B2","#CC79A7")) +
  coord_flip() +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
lgage3

lgage4 <- ggplot(data=sum2,mapping=aes(x=Lg,y=perc,fill=Age_grp)) +
  geom_bar(stat="identity",color="gray30",alpha=0.7) +
  scale_x_discrete(name="League") +
  scale_y_continuous(name="Percentage of Players",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Age Group",values=c("#E69F00","#0072B2","#CC79A7")) +
  coord_flip() +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
lgage4

lgage5 <- ggplot(data=sum2,mapping=aes(x=Age_grp,y=Lg,fill=perc)) +
  geom_tile() +
  scale_fill_gradient2(low="khaki1",high="khaki4") +
  geom_text(aes(label=paste0(round(perc,0),"%"))) +
  scale_y_discrete(name=NULL,expand=expansion(mult=0)) +
  scale_x_discrete(name=NULL,expand=expansion(mult=0)) +
  theme_minimal() +
  theme(legend.position="none",
        aspect.ratio=1) +
  labs(title="Age Distribution of MLB Players",
       subtitle="by American and National Leagues")
lgage5


# Script created at 2021-05-18 18:47:40
