library(tidyverse)

#!# Set to your own working directory and have just your filename below.
wae <- read.csv("https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/WalleyeErie2.csv") %>%
  filter(year==2003) %>%
  mutate(loc=plyr::mapvalues(loc,from=c(1,2,3),
              to=c("Toledo-Huron","Huron-Fairport","Fairport-Conneaut")),
         loc=factor(loc))
str(wae)

laa1 <- ggplot(data=wae,mapping=aes(x=age,y=tl)) +
  geom_point(size=3) +
  scale_x_continuous(name="Otolith Age (years)") +
  scale_y_continuous(name="Total Length (mm)") +
  theme_bw()
laa1

lw <- ggplot(data=wae,mapping=aes(x=tl,y=w)) +
  geom_point(size=3,shape=15,color="red3",alpha=0.5) +
  scale_x_continuous(name="Total Length (mm)") +
  scale_y_continuous(name="Weight (g)") +
  theme_bw()
lw

laa2 <- ggplot(data=wae,mapping=aes(x=age,y=tl,color=loc)) +
  geom_point(size=3,alpha=0.5) +
  scale_x_continuous(name="Otolith Age (years)") +
  scale_y_continuous(name="Total Length (mm)") +
  theme_bw()
laa2

laa3 <- ggplot(data=wae,mapping=aes(x=age,y=tl,color=w)) +
  geom_point(size=3,alpha=0.5) +
  scale_x_continuous(name="Otolith Age (years)") +
  scale_y_continuous(name="Total Length (mm)") +
  theme_bw()
laa3

laa4 <- ggplot(data=wae,mapping=aes(x=age,y=tl,color=sex,shape=loc)) +
  geom_point(size=3,alpha=0.5) +
  scale_x_continuous(name="Otolith Age (years)") +
  scale_y_continuous(name="Total Length (mm)") +
  theme_bw()
laa4

laa5 <- laa2 +
  scale_color_manual(values=c("#000000", "#E69F00", "#56B4E9"))
laa5


# Script created at 2020-05-04 21:33:56
