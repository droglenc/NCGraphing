library(tidyverse)
#!# Set to your own working directory and have just your filename below.
wae <- read.csv("https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/WalleyeErie2.csv") %>%
  filter(year==2003) %>%
  mutate(loc=plyr::mapvalues(loc,from=c(1,2,3),
              to=c("Toledo-Huron","Huron-Fairport","Fairport-Conneaut")),
         loc=factor(loc))

tl1 <- ggplot(data=wae,mapping=aes(x=loc,y=tl)) +
  geom_violin(color="gray50",fill="gray70",alpha=0.5,trim=FALSE) +
  stat_summary(fun.data=mean_cl_normal,geom="pointrange",size=1,shape=3) +
  scale_y_continuous(name="Mean (95% CI) Total Length (mm)") +
  scale_x_discrete(name="Location of Capture") +
  theme_minimal()
tl1

tl2 <- ggplot(data=wae,mapping=aes(x=loc,y=tl,color=sex)) +
  stat_summary(fun.data=mean_cl_normal,geom="pointrange",
               size=1,shape=21,fill="white",
               position=position_dodge(width=0.2)) +
  scale_y_continuous(name="Mean (95% CI) Total Length (mm)") +
  scale_x_discrete(name="Location of Capture") +
  theme_bw()
tl2

smry <- wae %>%
  group_by(loc) %>%
  summarize(n=n(),
            mean=mean(tl,na.rm=TRUE),
            sd=sd(tl,na.rm=TRUE)) %>%
  mutate(se=sd/sqrt(n),
         ci=qt(0.975,df=n-1)*se,
         lci=mean-ci,
         uci=mean+ci)

tl3 <- ggplot(data=smry,mapping=aes(x=loc,y=mean)) +
  geom_pointrange(aes(ymin=lci,ymax=uci),pch=21,fill="white",size=1) +
  geom_label(aes(label=formatC(mean,format="f",digits=0)),hjust=-0.25) +
  scale_x_discrete(name="Location of Capture") +
  scale_y_continuous(name="Mean Total Length (95% CI) (mm)") +
  theme_bw()
tl3

tl4 <- ggplot() +
  geom_jitter(data=wae,aes(x=loc,y=tl),width=0.05,alpha=0.1) +
  geom_pointrange(data=smry,mapping=aes(x=loc,y=mean,ymin=lci,ymax=uci),
                  pch=21,fill="white",color="red",size=0.6) +
  geom_label(data=smry,mapping=aes(x=loc,y=mean,
                                   label=formatC(mean,format="f",digits=0)),
             hjust=-0.5) +
  scale_x_discrete(name="Location of Capture") +
  scale_y_continuous(name="Mean Total Length (95% CI) (mm)") +
  theme_bw()
tl4


# Script created at 2020-05-11 18:32:29
