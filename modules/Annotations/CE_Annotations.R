library(tidyverse)

gt <- read.csv("https://www.ncdc.noaa.gov/cag/global/time-series/globe/land_ocean/1/2/1880-2020/data.csv",skip=4)
ggplot(data=gt,mapping=aes(x=Year,y=Value,fill=Value>0)) +
  geom_bar(stat="identity",color="black",size=0.25) +
  geom_hline(yintercept=0) +
  scale_x_continuous(breaks=seq(1880,2020,20)) +
  scale_fill_manual(values=c("blue4","red4")) +
  theme_bw() + theme(legend.position="none") +
  labs(title="February Global Temperature Anomaly (C)",
       subtitle="with respect to the 1910-2000 average",
       x=element_blank(),y=element_blank())

lvls_agree <- c("Strongly Disagree","Disagree","Neutral","Agree","Strongly Agree")

#!# Set to your own working directory and have just your filename below.
sow <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/StateOfWolf.csv") %>%
  dplyr::select(state,hunt_deer,seen_wolf,part_deer,
         ad_healthy_deer,ad_nowolves_deer,ad_threaten_deer,ad_deer_hunting) %>%
  filter(complete.cases(.)) %>%
  mutate(part_deer=factor(part_deer,
          levels=c("Stop Participating","Participate Less Frequently",
                   "Participate More Frequently","No Changes")),
         ad_healthy_deer=factor(ad_healthy_deer,levels=lvls_agree),
         ad_nowolves_deer=factor(ad_nowolves_deer,levels=lvls_agree),
         ad_threaten_deer=factor(ad_threaten_deer,levels=lvls_agree),
         ad_deer_hunting=factor(ad_deer_hunting,levels=lvls_agree)) %>%
  filter(hunt_deer=="Yes")

clrs <- c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2")
ggplot(data=sow,mapping=aes(x=state,fill=ad_deer_hunting)) +
  geom_bar(color="gray30",alpha=0.7) +
  scale_x_discrete(name="State") +
  scale_y_continuous(name="Frequency of Respondents",expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Agreement",values=clrs) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank()) +
  annotate(geom="label",x=2.5,y=400,label="MN data not\n yet recorded",hjust="left") +
  annotate(geom="curve",x=2.5,y=400,xend=2,yend=7,curvature=0.1,size=0.25,
           arrow=arrow(length=unit(3,"mm"),angle=15,type="closed"))

dh <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/DeerHarvest.csv")
clrs <- c("Ashland"="#000000","Bayfield"="#E69F00",
          "Douglas"="#56B4E9","Iron"="#009E73")

ggplot(data=dh,mapping=aes(x=Year,y=Ttl.All,color=County)) +
  geom_line(size=1) +
  geom_point(shape=21,fill="white",size=2) +
  scale_x_continuous(name="Year",breaks=seq(2010,2018,2)) +
  scale_y_continuous(name="Total Annual Deer Harvest",expand=expansion(mult=0),limits=c(0,8000)) +
  scale_color_manual(values=clrs) +
  theme_bw() + theme(legend.position="none") +
  annotate(geom="label",label=c("Ashland","Bayfield","Douglas","Iron"),
                         x=c(2010,2010,2010.8,2010.8),
                         y=c(2950,4600,7000,900),color=clrs,hjust="inward")

tuit <- read.csv("https://derekogle.com/NCGraphing/modules/Annotations/WI_College_Costs.csv")
nc <- filter(tuit,College=="Northland C")

ggplot(data=tuit,mapping=aes(x=RoomBoardOn,y=RoomBoardOff)) +
  geom_point(size=1.2) +
  geom_point(data=nc,color="red",size=1.3) +
  theme_bw() + theme(legend.position="none") +
  geom_abline(slope=1,intercept=0,linetype="dashed") +
  labs(title="On- versus Off-Campus Room and Board Costs",
      subtitle="Wisconsin 4-Year Private Colleges",
  scale_x_continuous(name="On-Campus",labels=scales::dollar) +
  scale_y_continuous(name="Off-Campus",labels=scales::dollar) +
  annotate(geom="label",x=8500,y=12500,label="Cheaper On-Campus",size=4,
           label.padding = unit(0.35, "lines")) +
  annotate(geom="label",x=12000,y=5000,label="Cheaper Off-Campus",size=4,
           label.padding = unit(0.35, "lines")) +
  annotate(geom="text",x=11000,y=9000,label="Northland C",color="red",hjust="left") +
  annotate(geom="segment",x=11000,y=9000,xend=9406,yend=9406,color="red",size=0.4,
               arrow=arrow(length=unit(2,"mm"),angle=15,type="closed"))

ggplot(data=tuit,mapping=aes(x=RoomBoardOn,y=RoomBoardOff)) +
  geom_point(size=1.2) +
  geom_point(data=nc,color="red",size=1.3) +
  theme_bw() + theme(legend.position="none") +
  geom_abline(slope=1,intercept=0,linetype="dashed") +
  labs(title="On- versus Off-Campus Room and Board Costs",
      subtitle="Wisconsin 4-Year Private Colleges",
  scale_x_continuous(name="On-Campus",labels=scales::dollar) +
  scale_y_continuous(name="Off-Campus",labels=scales::dollar) +
  ggrepel::geom_text_repel(mapping=aes(label=College)) +
  annotate(geom="label",x=8500,y=12500,label="Cheaper On-Campus",size=4,
           label.padding=unit(0.35,"lines")) +
  annotate(geom="label",x=12250,y=5500,label="Cheaper Off-Campus",size=4,
           label.padding=unit(0.35,"lines"))


# Script created at 2020-05-18 09:38:10
