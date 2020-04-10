library(tidyverse)
wae <- read.csv("https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/WalleyeErie2.csv") %>%
  filter(year==2003) %>%
  mutate(loc=plyr::mapvalues(loc,from=c(1,2,3),
              to=c("Toledo-Huron","Huron-Fairport","Fairport-Conneaut")),
         loc=factor(loc))

tl1 <- ggplot(data=wae,mapping=aes(x=tl)) +
  geom_histogram(color="gray30",fill="gray70",
             binwidth=10,boundary=0,closed="left") +
  scale_x_continuous(name="Total Length (mm)",breaks=seq(0,700,50),
    expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Frequency of Walleye",
    expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.minor.y=element_blank())
tl1

tl2 <- ggplot(data=wae,mapping=aes(x=tl)) +
  geom_density(color="gray30",fill="gray70",adjust=0.25) +
  scale_x_continuous(name="Total Length (mm)",breaks=seq(0,700,50),
                     expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Density of Walleye",expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
tl2

tl3 <- ggplot(data=wae,mapping=aes(x=tl,color=loc,fill=loc)) +
  geom_density(alpha=0.5) +
  scale_x_continuous(name="Total Length (mm)",breaks=seq(0,700,50),
                     expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Density of Walleye",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Location",values=c("#E69F00","#0072B2","#CC79A7")) +
  scale_color_manual(name="Location",values=c("#E69F00","#0072B2","#CC79A7")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
tl3

tl4 <- ggplot(data=wae,mapping=aes(x=loc,y=tl)) +
  geom_boxplot(fill="lightsalmon") +
  scale_x_discrete(name="Location of Capture") +
  scale_y_continuous(name="Total Length (mm)") +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
tl4

tl5 <- ggplot(data=wae,mapping=aes(x=loc,y=tl)) +
  geom_violin(fill="lightsalmon",trim=FALSE) +
  scale_x_discrete(name="Location of Capture") +
  scale_y_continuous(name="Total Length (mm)") +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank())
tl5

tl6 <- ggplot(data=wae,mapping=aes(x=loc,y=tl,color=loc,fill=loc)) +
  geom_violin(trim=FALSE) +
  scale_x_discrete(name="Location of Capture") +
  scale_y_continuous(name="Total Length (mm)") +
  scale_fill_manual(values=c("#E69F00","#0072B2","#CC79A7")) +
  scale_color_manual(values=c("#E69F00","#0072B2","#CC79A7")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank()) +
  theme(legend.position="none")
tl6

tl7 <- ggplot(data=wae,mapping=aes(y=loc,x=tl,color=loc,fill=loc)) +
  geom_violin(trim=FALSE) +
  scale_y_discrete(name="Location of Capture") +
  scale_x_continuous(name="Total Length (mm)") +
  scale_fill_manual(values=c("#E69F00","#0072B2","#CC79A7")) +
  scale_color_manual(values=c("#E69F00","#0072B2","#CC79A7")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank()) +
  theme(legend.position="none")
tl7


# Script created at 2020-04-10 15:58:51
