library(tidyverse)

fn <- "Data_wolves_moose_Isle_Royale_June2019.xlsx"
irmw <- readxl::read_excel(fn,sheet="1. population level data",skip=1)

irmw %<>%
  select(year,wolves,moose,`Jan-Feb (temp, F)`,
         `ice bridges (0=none, 1 = present)`) %>%
  rename(winter_temp=`Jan-Feb (temp, F)`,
         ice_bridges=`ice bridges (0=none, 1 = present)`) %>%
  mutate(ice_bridges=plyr::mapvalues(ice_bridges,from=c(0,1),to=c("no","yes")),
         ice_bridges=factor(ice_bridges))
head(irmw)

head(irmw)

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves))

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_point()

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_line()

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_bar(stat="identity")

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_point() +
  geom_line() +
  geom_rug()

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_point(color="darkred",size=3) +
  geom_line(size=1.5,linetype="dashed")

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_line(size=1.5,linetype="dashed") +
  geom_point(color="darkred",size=3)

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves,
                        color="darkred")) +
  geom_line() +
  geom_point(size=3)

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves,
                        color=ice_bridges)) +
  geom_line() +
  geom_point(size=3)

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_line() + #BREAK
  geom_point(aes(color=ice_bridges),size=3)

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_line() + #BREAK
  geom_point(aes(color=winter_temp),size=3)

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_line() + #BREAK
  geom_point(aes(color=winter_temp,
                 shape=ice_bridges),
             size=3)

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_line() +
  geom_point(aes(color=ice_bridges),size=3) + #BREAK
  scale_color_manual(values=c("blue","red"),
                     name="Ice Bridge?") + #BREAK
  scale_x_continuous(name="Year",
                     breaks=seq(1960,2020,5),
                     minor_breaks=seq(1959,2019,1)) + #BREAK
  scale_y_continuous(name="Estimated Number of Wolves",
                     breaks=seq(0,50,5),
                     minor_breaks=NULL)

p <- ggplot(data=irmw,
            mapping=aes(x=year,y=wolves)) +
  geom_line() +
  geom_point(aes(color=ice_bridges),size=3) +
  scale_color_manual(values=c("blue","red"),
                     name="Ice Bridge?") +
  scale_x_continuous(name="Year",
                     breaks=seq(1960,2020,5)) +
  scale_y_continuous(name="Estimated Number of Wolves",
                     breaks=seq(0,50,5)) + #BREAK
  theme_classic()

 p + #BREAK
  theme_minimal()

p + #BREAK
  theme_bw()


# Script created at 2020-04-08 15:38:25
