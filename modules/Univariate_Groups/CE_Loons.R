library(tidyverse)
loon <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/Loon1.csv")

reg1 <- ggplot(data=loon,mapping=aes(x=region)) +
  geom_bar(color="gray30",fill="wheat") +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Frequency of Loons",expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
reg1

regsex1 <- ggplot(data=loon,mapping=aes(x=region,fill=sex)) +
  geom_bar(color="gray30",alpha=0.7) +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Frequency of Loons",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Sex",values=c("#E69F00","#0072B2","#CC79A7")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
regsex1

regsex2 <- ggplot(data=loon,mapping=aes(x=region,fill=sex)) +
  geom_bar(position="dodge",color="gray30",alpha=0.7) +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Frequency of Loons",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Sex",values=c("#E69F00","#0072B2","#CC79A7")) +
  coord_flip() +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
regsex2

sum1 <- loon %>%
  group_by(region) %>%
  summarize(freq=n()) %>%
  ungroup()

reg1a <- ggplot(data=sum1,mapping=aes(x=region,y=freq)) +
  geom_bar(stat="identity",color="gray30",fill="wheat") +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Frequency of Loons",expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
reg1a

sum2 <- loon %>%
  group_by(region,sex) %>%
  summarize(freq=n()) %>%
  mutate(perc=freq/sum(freq)*100) %>%
  ungroup()
  
regsex3 <- ggplot(data=sum2,mapping=aes(x=region,y=freq,fill=sex)) +
  geom_bar(stat="identity",color="gray30",alpha=0.7) +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Frequency of Loons",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Sex",values=c("#E69F00","#0072B2","#CC79A7")) +
  coord_flip() +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
regsex3

regsex4 <- ggplot(data=sum2,mapping=aes(x=region,y=perc,fill=sex)) +
  geom_bar(stat="identity",color="gray30",alpha=0.7) +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Percentage of Loons",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Sex",values=c("#E69F00","#0072B2","#CC79A7")) +
  coord_flip() +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
regsex4


# Script created at 2020-04-13 07:53:47
