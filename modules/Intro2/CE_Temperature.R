library(tidyverse)

#!# Set to your own working directory and have just your filename below.
gt <- read.csv("https://www.ncdc.noaa.gov/cag/global/time-series/globe/land_ocean/1/2/1880-2020/data.csv",skip=4)
str(gt)

ft1 <- ggplot(data=gt,mapping=aes(x=Year,y=Value)) +
  geom_point(size=1.25) +
  geom_line() +
  scale_x_continuous(name="Year") +
  scale_y_continuous(name="February Temperature Anomaly (C)") +
  theme_bw()
ft1

ft2 <- ggplot(data=gt,mapping=aes(x=Year,y=Value)) +
  geom_line(size=0.75) +
  geom_point(size=1.25,color="red",alpha=0.5) +
  scale_x_continuous(name="Year",breaks=seq(1880,2020,20)) +
  scale_y_continuous(name="February Temperature Anomaly (C)") +
  theme_bw()
ft2

ft3 <- ggplot(data=gt,mapping=aes(x=Year,y=Value)) +
  geom_bar(stat="identity",fill="blue") +
  scale_x_continuous(name="Year",breaks=seq(1880,2020,20)) +
  scale_y_continuous(name="February Temperature Anomaly (C)") +
  theme_bw()
ft3

ft3 <- ggplot(data=gt,mapping=aes(x=Year,y=Value,fill=Value>0)) +
  geom_bar(stat="identity",color="black",size=0.25) +
  geom_hline(yintercept=0) +
  scale_x_continuous(name="Year",breaks=seq(1880,2020,20)) +
  scale_y_continuous(name="February Temperature Anomaly (C)") +
  scale_fill_manual(values=c("blue4","red4")) +
  theme_bw() +
  theme(legend.position="none")
ft3

ft4 <- ggplot(data=gt,mapping=aes(x=Year,y=Value,fill=Value,color=Value)) +
  geom_bar(stat="identity") +
  geom_hline(yintercept=0) +
  scale_x_continuous(name="Year",breaks=seq(1880,2020,20)) +
  scale_y_continuous(name="February Temperature Anomaly (C)") +
  scale_fill_gradient2(low="blue",mid="white",high="red",aesthetics=c("fill","color")) +
  theme_bw() +
  theme(legend.position="none")
ft4


# Script created at 2021-07-19 07:53:55
