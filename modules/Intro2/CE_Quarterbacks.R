library(tidyverse)

#!# Set to your own working directory and have just your filename below.
qbs <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/NCAAF19_QBS.csv",
                stringsAsFactors=FALSE) %>%
  filter(Conf %in% c("ACC","Big 12","Big Ten","Pac-12","SEC")) %>%
  mutate(Conf=factor(Conf))
str(qbs)

risk <- ggplot(data=qbs,mapping=aes(x=Int,y=Y_A)) +
  geom_point(size=3) +
  scale_x_continuous(name="Number of Interceptions") +
  scale_y_continuous(name="Passing Yards per Passing Attempt") +
  theme_bw()
risk

act <- ggplot(data=qbs,mapping=aes(x=RAtt,y=Att)) +
  geom_point(size=3,shape=15,color="red3",alpha=0.5) +
  scale_x_continuous(name="Rushing Attempts") +
  scale_y_continuous(name="Passing Attempts") +
  theme_bw()
act

act2 <- ggplot(data=qbs,mapping=aes(x=RAtt,y=Att,color=Conf)) +
  geom_point(size=3) +
  scale_x_continuous(name="Rushing Attempts") +
  scale_y_continuous(name="Passing Attempts") +
  theme_bw()
act2

act3 <- ggplot(data=qbs,mapping=aes(x=RAtt,y=Att,color=Pct)) +
  geom_point(size=3) +
  scale_x_continuous(name="Rushing Attempts") +
  scale_y_continuous(name="Passing Attempts") +
  theme_bw()
act3

act4 <- ggplot(data=qbs,mapping=aes(x=RAtt,y=Att,color=Conf,shape=Conf)) +
  geom_point(size=3) +
  scale_x_continuous(name="Rushing Attempts") +
  scale_y_continuous(name="Passing Attempts") +
  theme_bw()
act4

act5 <- act2 +
  scale_color_manual(values=c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442"))
act5


# Script created at 2020-05-01 18:00:09
