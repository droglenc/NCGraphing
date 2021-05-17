library(tidyverse)
#!# Set to your own working directory and have just your filename below.
loon <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/Loon1.csv")

wt1 <- ggplot(data=loon,mapping=aes(x=sex,y=weight)) +
  geom_violin(color="gray50",fill="gray70",alpha=0.5,trim=FALSE) +
  stat_summary(fun.data=mean_cl_normal,geom="pointrange",size=1,shape=3) +
  scale_y_continuous(name="Mean (95% CI) Weight (g)") +
  scale_x_discrete(name="Sex") +
  theme_minimal()
wt1

wt2 <- ggplot(data=loon,mapping=aes(x=region,y=weight,color=sex)) +
  stat_summary(fun.data=mean_cl_normal,geom="pointrange",
               size=1,shape=21,fill="white",
               position=position_dodge(width=0.2)) +
  scale_y_continuous(name="Mean (95% CI) Weight (g)") +
  scale_x_discrete(name="Region") +
  theme_bw()
wt2

smry <- loon %>%
  group_by(region) %>%
  summarize(n=n(),
            mean=mean(weight,na.rm=TRUE),
            sd=sd(weight,na.rm=TRUE)) %>%
  mutate(se=sd/sqrt(n),
         ci=qt(0.975,df=n-1)*se,
         lci=mean-ci,
         uci=mean+ci)

wt3 <- ggplot(data=smry,mapping=aes(x=region,y=mean)) +
  geom_pointrange(aes(ymin=lci,ymax=uci),pch=21,fill="white",size=1) +
  geom_label(aes(label=formatC(mean,format="f",digits=0)),hjust=-0.25) +
  scale_x_discrete(name="Region of Capture") +
  scale_y_continuous(name="Mean Weight (95% CI) (g)") +
  theme_bw()
wt3

wt4 <- wt3 +
  geom_jitter(data=loon,aes(x=region,y=weight),width=0.05,alpha=0.5)
wt4


# Script created at 2021-05-17 08:51:18
