library(tidyverse)
#!# Set to your own working directory and have just your filename below.
loon <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/Loon1.csv")

wt1 <- ggplot(data=loon,mapping=aes(x=weight)) +
  geom_histogram(color="gray30",fill="gray70",binwidth=250,boundary=0,closed="left") +
  scale_x_continuous(name="Body Weight (g)",expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Frequency of Loons",breaks=seq(0,15,5),  
    expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.minor.y=element_blank())
wt1

wt2 <- ggplot(data=loon,mapping=aes(x=weight)) +
  geom_density(color="gray30",fill="gray70",adjust=0.25) +
  scale_x_continuous(name="Weight (g)",expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Density of Loons",expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
wt2

wt3 <- ggplot(data=loon,mapping=aes(x=weight,color=sex,fill=sex)) +
  geom_density(alpha=0.5) +
  scale_x_continuous(name="Weight (g)",expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Density of Loons",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(values=c("#E69F00","#0072B2","#CC79A7")) +
  scale_color_manual(values=c("#E69F00","#0072B2","#CC79A7")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
wt3

wt4 <- ggplot(data=loon,mapping=aes(x=sex,y=weight)) +
  geom_boxplot(fill="wheat2") +
  scale_x_discrete(name="Sex of Loon") +
  scale_y_continuous(name="Weight (g)") +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
wt4

wt5 <- ggplot(data=loon,mapping=aes(x=sex,y=weight)) +
  geom_violin(fill="wheat2",trim=FALSE) +
  scale_x_discrete(name="Sex of Loon") +
  scale_y_continuous(name="Weight (g)") +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
wt5

wt6 <- ggplot(data=loon,mapping=aes(x=sex,y=weight,color=sex,fill=sex)) +
  geom_violin(trim=FALSE) +
  scale_x_discrete(name="Sex of Loon") +
  scale_y_continuous(name="Weight (g)") +
  scale_fill_manual(values=c("#E69F00","#0072B2","#CC79A7")) +
  scale_color_manual(values=c("#E69F00","#0072B2","#CC79A7")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank()) +
  theme(legend.position="none")
wt6

wt7 <- ggplot(data=loon,mapping=aes(y=sex,x=weight,color=sex,fill=sex)) +
  geom_violin(trim=FALSE) +
  scale_y_discrete(name="Sex of Loon") +
  scale_x_continuous(name="Weight (g)") +
  scale_fill_manual(values=c("#E69F00","#0072B2","#CC79A7")) +
  scale_color_manual(values=c("#E69F00","#0072B2","#CC79A7")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank()) +
  theme(legend.position="none")
wt7

wt8 <- wt1 +
  facet_grid(row=vars(sex))
wt8


# Script created at 2021-05-17 08:50:08
