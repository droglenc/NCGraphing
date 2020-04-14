library(tidyverse)

#!# Load and Prep Data
irmw <- read.csv("https://derekogle.com/NCGraphing/modules/zdata/Data_wolves_moose_Isle_Royale_June2019.csv",
                 na.strings=c("NA","N/A"))

#!# Cleaning up messy names and reducing size of data.frame (for lecture only)
irmw %<>%
  select(year,wolves,moose,Jan.Feb..temp..F.,ice.bridges..0.none..1...present.) %>%
  rename(winter_temp=Jan.Feb..temp..F.,
         ice_bridges=ice.bridges..0.none..1...present.) %>%
  mutate(ice_bridges=plyr::mapvalues(ice_bridges,from=c(0,1),to=c("no","yes")),
         ice_bridges=factor(ice_bridges))
head(irmw)


#!# Adding geoms to a base ggplot (using all defaults)
p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_point()

p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_line()

p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_bar(stat="identity")

p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_point() +
  geom_line() +
  geom_rug()


#!# Setting aesthetics within a geom
p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_point(color="darkred",size=3) +
  geom_line(size=1.5,linetype="dashed")

#!# ... order of geoms matters
p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_line(size=1.5,linetype="dashed") +
  geom_point(color="darkred",size=3)

#!# Setting a color aesthetic for all geoms
p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves,color="darkred")) +
  geom_line() +
  geom_point(size=3)

#!# Mapping a color aesthetic to a variable for all geoms
p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves,color=ice_bridges)) +
  geom_line() +
  geom_point(size=3)

#!# Mapping a color aesthetic to a variable for one geom
p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_line() +
  geom_point(aes(color=ice_bridges),size=3)

p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_line() +
  geom_point(aes(color=winter_temp),size=3)

p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_line() +
  geom_point(aes(color=winter_temp,shape=ice_bridges),size=3)

#!# Using scales to control colors and axis labels
p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_line() +
  geom_point(aes(color=ice_bridges),size=3) +
  scale_color_manual(values=c("blue","red"),name="Ice Bridge?") +
  scale_x_continuous(name="Year",breaks=seq(1960,2020,10),
                     minor_breaks=seq(1959,2019,1)) +
  scale_y_continuous(name="Estimated Number of Wolves",
                     breaks=seq(0,50,5),minor_breaks=NULL)

#!# Demonstrating themes
p <- ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_line() +
  geom_point(aes(color=ice_bridges),size=3) +
  scale_color_manual(values=c("blue","red"),name="Ice Bridge?") +
  scale_x_continuous(name="Year",breaks=seq(1960,2020,5)) +
  scale_y_continuous(name="Estimated Number of Wolves",breaks=seq(0,50,5)) +
  theme_classic()

p + theme_minimal()

p + theme_bw()

# Script created at 2020-04-14 12:43:51
