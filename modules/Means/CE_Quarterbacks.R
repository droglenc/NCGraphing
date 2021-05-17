library(tidyverse)
#!# Set to your own working directory and have just your filename below.
qbs <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/NCAAF19_QBS.csv",
                stringsAsFactors=FALSE) %>%
  filter(Conf %in% c("ACC","Big 12","Big Ten","Pac-12","SEC")) %>%
  mutate(Conf=factor(Conf))

PYds1 <- ggplot(data=qbs,mapping=aes(x=Conf,y=PYds)) +
  geom_violin(color="gray50",fill="gray70",alpha=0.5,trim=FALSE) +
  stat_summary(fun.data=mean_cl_normal,geom="pointrange",size=1,shape=3) +
  scale_y_continuous(name="Mean (95% CI) Total Passing Yards") +
  scale_x_discrete(name="Conference") +
  theme_minimal()
PYds1

PYds2 <- ggplot(data=qbs,mapping=aes(x=Conf,y=PYds,color=Att>350)) +
  stat_summary(fun.data=mean_cl_normal,geom="pointrange",
               size=1,shape=21,fill="white",
               position=position_dodge(width=0.3)) +
  scale_y_continuous(name="Mean (95% CI) Total Passing Yards") +
  scale_x_discrete(name="Conference") +
  theme_bw()
PYds2

smry <- qbs %>%
  group_by(Conf) %>%
  summarize(n=n(),
            mean=mean(PYds,na.rm=TRUE),
            sd=sd(PYds,na.rm=TRUE)) %>%
  mutate(se=sd/sqrt(n),
         ci=qt(0.975,df=n-1)*se,
         lci=mean-ci,
         uci=mean+ci)

PYds3 <- ggplot(data=smry,mapping=aes(x=Conf,y=mean)) +
  geom_pointrange(aes(ymin=lci,ymax=uci),pch=21,fill="white",size=1) +
  geom_label(aes(label=formatC(mean,format="f",digits=0)),hjust=-0.25) +
  scale_x_discrete(name="Conference") +
  scale_y_continuous(name="Mean Total Passing Yards (95% CI) (g)") +
  theme_bw()
PYds3

PYds4 <- PYds3 +
  geom_jitter(data=qbs,aes(x=Conf,y=PYds),width=0.075,alpha=0.5)
PYds4


# Script created at 2021-05-17 08:51:06
