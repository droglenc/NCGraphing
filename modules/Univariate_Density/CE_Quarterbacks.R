library(tidyverse)
#!# Set to your own working directory and have just your filename below.
qbs <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/NCAAF19_QBS.csv",
                stringsAsFactors=FALSE) %>%
  filter(Conf %in% c("ACC","Big 12","Big Ten","Pac-12","SEC")) %>%
  mutate(Conf=factor(Conf))

PYds1 <- ggplot(data=qbs,mapping=aes(x=PYds)) +
  geom_histogram(color="gray30",fill="gray70",binwidth=200,boundary=0,closed="left") +
  scale_x_continuous(name="Total Passing Yards",breaks=seq(1000,6000,500),
    limits=c(1000,6000),expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Frequency of Quarterbacks",expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.minor.y=element_blank())
PYds1

PYds2 <- ggplot(data=qbs,mapping=aes(x=PYds)) +
  geom_density(color="gray30",fill="gray70",adjust=0.25) +
  scale_x_continuous(name="Total Passing Yards (mm)",breaks=seq(1000,6000,500),
                     limits=c(1000,6000),expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Density of Quarterbacks",expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
PYds2

PYds3 <- ggplot(data=qbs,mapping=aes(x=PYds,color=Conf,fill=Conf)) +
  geom_density(alpha=0.5) +
  scale_x_continuous(name="Total Passing Yards (mm)",breaks=seq(1000,6000,500),
                     limits=c(1000,6000),expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Density of Quarterbacks",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Location",
                    values=c("#000000","#E69F00","#56B4E9","#009E73","#F0E442")) +
  scale_color_manual(name="Location",
                     values=c("#000000","#E69F00","#56B4E9","#009E73","#F0E442")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
PYds3

PYds4 <- ggplot(data=qbs,mapping=aes(x=Conf,y=PYds)) +
  geom_boxplot(fill="lightsalmon") +
  scale_x_discrete(name="Conference") +
  scale_y_continuous(name="Total Passing Yards (mm)") +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
PYds4

PYds5 <- ggplot(data=qbs,mapping=aes(x=Conf,y=PYds)) +
  geom_violin(fill="lightsalmon",trim=FALSE) +
  scale_x_discrete(name="Conference") +
  scale_y_continuous(name="Total Passing Yards (mm)") +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
PYds5

PYds6 <- ggplot(data=qbs,mapping=aes(x=Conf,y=PYds,color=Conf,fill=Conf)) +
  geom_violin(trim=FALSE) +
  scale_x_discrete(name="Conference") +
  scale_y_continuous(name="Total Passing Yards (mm)") +
  scale_fill_manual(values=c("#000000","#E69F00","#56B4E9","#009E73","#F0E442")) +
  scale_color_manual(values=c("#000000","#E69F00","#56B4E9","#009E73","#F0E442")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank()) +
  theme(legend.position="none")
PYds6

PYds7 <- ggplot(data=qbs,mapping=aes(y=Conf,x=PYds,color=Conf,fill=Conf)) +
  geom_violin(trim=FALSE) +
  scale_y_discrete(name="Conference") +
  scale_x_continuous(name="Total Passing Yards (mm)") +
  scale_fill_manual(values=c("#000000","#E69F00","#56B4E9","#009E73","#F0E442")) +
  scale_color_manual(values=c("#000000","#E69F00","#56B4E9","#009E73","#F0E442")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank()) +
  theme(legend.position="none")
PYds7

PYds8 <- PYds1 +
  facet_grid(row=vars(Conf))
PYds8


# Script created at 2021-05-17 08:52:57
