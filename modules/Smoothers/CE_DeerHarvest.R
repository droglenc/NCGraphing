library(tidyverse)

#!# Set to your own working directory and have just your filename below.
dh <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/DeerHarvest.csv")
str(dh)
clrs <- c("Ashland"="#000000","Bayfield"="#E69F00","Douglas"="#56B4E9","Iron"="#009E73")

 bgHarv1 <- ggplot(data=dh,mapping=aes(x=Gun.Antlerless,y=Bow.Antlerless)) +
  geom_smooth(method="lm",color="blue",fill="blue",alpha=0.15) +
  geom_point(pch=21,color="black",fill="gray70",size=2.5) +
  scale_x_continuous(name="Harvest of Antlerless Deer by Gun",
                     expand=expansion(mult=0.02)) +
  scale_y_continuous(name="Harvest of Antlerless Deer by Bow",
                     expand=expansion(mult=0.01)) +
  theme_bw() +
  theme(panel.grid=element_blank())
bgHarv1

 bgHarv2 <- ggplot(data=dh,mapping=aes(x=Gun.Antlerless,y=Bow.Antlerless)) +
  geom_smooth(method="lm",color="blue",fill="blue",alpha=0.15) +
  geom_smooth(method="loess",color="red",fill="red",alpha=0.15) +
  geom_point(pch=21,color="black",fill="gray70",size=2.5) +
  scale_x_continuous(name="Harvest of Antlerless Deer by Gun",
                     expand=expansion(mult=0.02)) +
  scale_y_continuous(name="Harvest of Antlerless Deer by Bow",
                     expand=expansion(mult=0.01)) +
  theme_bw() +
  theme(panel.grid=element_blank())
bgHarv2

 bgHarv3 <- ggplot(data=dh,mapping=aes(x=Gun.Antlerless,y=Bow.Antlerless,
                                       color=County,fill=County)) +
  geom_smooth(method="lm",alpha=0.15,se=FALSE) +
  geom_point(pch=21,size=2.5,alpha=0.5) +
  scale_x_continuous(name="Harvest of Antlerless Deer by Gun",
                     expand=expansion(mult=0.02)) +
  scale_y_continuous(name="Harvest of Antlerless Deer by Bow",
                     expand=expansion(mult=0.01)) +
  scale_color_manual(values=clrs) +
  scale_fill_manual(values=clrs) +
  theme_bw() +
  theme(panel.grid=element_blank())
bgHarv3

harv1 <- ggplot(data=dh,mapping=aes(x=Year,y=Ttl.All,color=County)) +
  geom_smooth(method="loess",size=1,se=FALSE) +
  geom_point(size=2.5) +
  scale_x_continuous(name="Year",breaks=seq(2010,2018,2)) +
  scale_y_continuous(name="Total Annual Deer Harvest",
                     expand=expansion(mult=c(0,0.05)),
                     limits=c(0,8000)) +
  scale_fill_manual(values=clrs) +
  scale_color_manual(values=clrs) +
  theme_bw() +
  theme(panel.grid.minor=element_blank())
harv1

 aaHarv1 <- ggplot(data=dh,mapping=aes(x=Ttl.Antlered,y=Ttl.Antlerless)) +
  geom_smooth(method="loess",color="red",fill="red3",alpha=0.1) +
  geom_point(aes(color=County,fill=County),pch=21,size=2.5,alpha=0.5) +
  scale_x_continuous(name="Total Harvest of Antlered Deer",
                     expand=expansion(mult=0.02)) +
  scale_y_continuous(name="Total Harvest of Antlerless Deer",
                     expand=expansion(mult=0.01)) +
  scale_color_manual(values=clrs) +
  scale_fill_manual(values=clrs) +
  theme_bw() +
  theme(panel.grid=element_blank())
aaHarv1


# Script created at 2021-05-17 08:50:26
