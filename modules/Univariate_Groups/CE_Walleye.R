library(tidyverse)
wae <- read.csv("https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/WalleyeErie2.csv") %>%
  filter(year==2003) %>%
  mutate(loc=plyr::mapvalues(loc,from=c(1,2,3),
              to=c("Toledo-Huron","Huron-Fairport","Fairport-Conneaut")),
         loc=factor(loc))

reg1 <- ggplot(data=wae,mapping=aes(x=loc)) +
  geom_bar(color="gray30",fill="wheat") +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Frequency of Walleye",expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
reg1

regsex1 <- ggplot(data=wae,mapping=aes(x=loc,fill=sex)) +
  geom_bar(color="gray30",alpha=0.7) +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Frequency of Walleye",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Sex",values=c("#E69F00","#0072B2","#CC79A7")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
regsex1

regsex2 <- ggplot(data=wae,mapping=aes(x=loc,fill=sex)) +
  geom_bar(color="gray30",alpha=0.7) +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Frequency of Walleye",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Sex",values=c("#E69F00","#0072B2","#CC79A7")) +
  coord_flip() +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
regsex2

sum1 <- wae %>%
  group_by(loc) %>%
  summarize(freq=n()) %>%
  ungroup()

reg1a <- ggplot(data=sum1,mapping=aes(x=loc,y=freq)) +
  geom_bar(stat="identity",color="gray30",fill="wheat") +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Frequency of Walleye",expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
reg1a

sum2 <- wae %>%
  group_by(loc,sex) %>%
  summarize(freq=n()) %>%
  mutate(perc=freq/sum(freq)*100) %>%
  ungroup()
  
regsex3 <- ggplot(data=sum2,mapping=aes(x=loc,y=freq,fill=sex)) +
  geom_bar(stat="identity",color="gray30",alpha=0.7) +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Frequency of Walleye",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Sex",values=c("#E69F00","#0072B2","#CC79A7")) +
  coord_flip() +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
regsex3

regsex4 <- ggplot(data=sum2,mapping=aes(x=loc,y=perc,fill=sex)) +
  geom_bar(stat="identity",color="gray30",alpha=0.7) +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Percentage of Walleye",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Sex",values=c("#E69F00","#0072B2","#CC79A7")) +
  coord_flip() +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
regsex4


# Script created at 2020-04-13 08:32:05
