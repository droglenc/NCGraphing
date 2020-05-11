library(tidyverse)

#!# Set to your own working directory and have just your filename below.
dh <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/DeerHarvest.csv")
str(dh)
cbbPalette <- c("#000000","#E69F00","#56B4E9","#009E73",
                "#F0E442","#0072B2","#D55E00","#CC79A7")

harv1 <- ggplot(data=dh,mapping=aes(x=County,y=Ttl.All)) +
  stat_summary(fun=mean,geom="bar",alpha=0.75) +
  stat_summary(fun.data=mean_cl_normal,geom="errorbar",width=0.1) +
  scale_x_discrete(name="County") +
  scale_y_continuous(name="Mean Total Annual Deer Harvest",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank())
harv1

harv2 <- ggplot(data=dh,mapping=aes(x=County,y=Ttl.All,
                                    fill=County,color=County)) +
  stat_summary(fun=mean,geom="bar",alpha=0.5) +
  stat_summary(fun.data=mean_cl_normal,geom="errorbar",width=0.1) +
  scale_x_discrete(name="County") +
  scale_y_continuous(name="Mean Total Annual Deer Harvest",
                     expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(values=cbbPalette) +
  scale_color_manual(values=cbbPalette) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        legend.position="none")
harv2

harv3 <- harv2 +
  coord_flip() +
  scale_x_discrete(name=element_blank()) +
  theme(panel.grid.major.y=element_blank())
harv3

harv4 <- harv3 +
  geom_jitter(width=0.1)
harv4

harv5 <- ggplot(data=dh,mapping=aes(x=Year,y=Ttl.All,color=County)) +
  geom_line(size=1) +
  geom_point(shape=21,fill="white",size=2) +
  scale_x_continuous(name="Year",breaks=seq(2010,2018,2)) +
  scale_y_continuous(name="Total Annual Deer Harvest",
                     expand=expansion(mult=c(0,0.05)),
                     limits=c(0,8000)) +
  scale_fill_manual(values=cbbPalette) +
  scale_color_manual(values=cbbPalette) +
  theme_bw()
harv5

smry <- dh %>%
  group_by(County) %>%
  summarize(n=n(),
            mean=mean(Ttl.All,na.rm=TRUE),
            sd=sd(Ttl.All,na.rm=TRUE)) %>%
  mutate(ci=qt(0.975,df=n-1)*sd/sqrt(n),
         lci=mean-ci,
         uci=mean+ci)

harv6 <- ggplot(data=smry,mapping=aes(x=County,y=mean)) +
  geom_bar(stat="identity",color="black",fill="gray70",alpha=0.75) +
  geom_errorbar(aes(ymin=mean,ymax=uci),width=0.1) +
  scale_x_discrete(name="County") +
  scale_y_continuous(name="Mean Total Annual Deer Harvest",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank())
harv6


# Script created at 2020-05-11 18:32:58
