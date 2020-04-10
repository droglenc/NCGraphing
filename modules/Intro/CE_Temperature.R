gt <- read.csv("https://www.ncdc.noaa.gov/cag/global/time-series/globe/land_ocean/1/2/1880-2020/data.csv",skip=4)
str(gt)

library(ggplot2)

ft1 <- ggplot(data=gt,mapping=aes(x=Year,y=Value)) +
  geom_point(size=2) +
  geom_line() +
  scale_x_continuous(name="Year") +
  scale_y_continuous(name="February Temperature Anomaly (C)") +
  theme_bw()
ft1

ft2 <- ggplot(data=gt,mapping=aes(x=Year,y=Value)) +
  geom_point(size=2,color="red",alpha=0.5) +
  geom_line(size=1.25) +
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
  geom_bar(stat="identity",color="black") +
  geom_hline(yintercept=0) +
  scale_x_continuous(name="Year",breaks=seq(1880,2020,20)) +
  scale_y_continuous(name="February Temperature Anomaly (C)") +
  scale_fill_manual(values=c("blue4","red4")) +
  theme_bw() +
  theme(legend.position="none")
ft3


# Script created at 2020-04-10 09:30:02
