#!# Loading the tidyverse package (must do every time)
library(tidyverse)

#!# Load and Prep Data
#!# Ordered lakes, created a decade variable

#!# Set to your own working directory and have just your filename below.
gli <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/GreatLakesIce.csv") %>%
  mutate(lake=factor(lake,levels=c("Superior","Michigan","Huron","Erie","Ontario")),
         decade=floor(year/10)*10,
         decade=factor(paste0(decade,"s"),levels=c("1970s","1980s","1990s","2000s","2010s")))

#!# Declaring a color palette so I don't have to type this every time

clrs <- c("Superior"="#000000","Michigan"="#E69F00","Huron"="#56B4E9",
          "Erie"="#009E73","Ontario"="#CC79A7")

#!# EDV ... Line Chart

ggplot(data=gli,mapping=aes(x=year,y=max.cover,color=lake)) +
  geom_line(size=0.4,alpha=0.75) +
  scale_x_continuous(name="Annual Ice Season") +
  scale_y_continuous(name="Maximum Ice Coverage (%)",
                     limits=c(0,100),expand=expansion(mult=0.01)) +
  scale_color_manual(name="Lake",values=clrs) +
  theme_bw()

#!# EDV ... line plot with faceting (peek into future)
last_plot() +
  facet_wrap(vars(lake)) +
  theme(legend.position="none")

#!# EDV ... violin plot

ggplot(data=gli,mapping=aes(x=lake,y=max.cover)) +
  geom_violin(color="gray50",fill="gray50",alpha=0.75,trim=FALSE) +
  geom_jitter(width=0.07,size=0.5,color="black",alpha=0.5) +
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Maximum Ice Coverage (%)",
                     limits=c(0,100),expand=expansion(mult=0.01)) +
  theme_bw()

#!# Barplot of means by lake using stat_summary()

ggplot(data=gli,mapping=aes(x=lake,y=max.cover)) + #BREAK
  stat_summary(fun=mean,geom="bar",
               fill="gray30",alpha=0.75) + #BREAK
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)",
                     limits=c(0,100),expand=expansion(mult=c(0,0.01))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank())

#!# Means by lake using points and stat_summary()

ggplot(data=gli,mapping=aes(x=lake,y=max.cover)) + #BREAK
  stat_summary(fun=mean,geom="point") + #BREAK
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)") +
  theme_bw() +
  theme(panel.grid.major.x=element_blank())

#!# Means by lake with bars and confidence intervals

ggplot(data=gli,mapping=aes(x=lake,y=max.cover)) + #BREAK
  stat_summary(fun=mean,geom="bar",fill="gray30",alpha=0.75) + #BREAK
  stat_summary(fun.data=mean_cl_normal,geom="errorbar",
               width=0.25) + #BREAK
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)",
                     limits=c(0,100),expand=expansion(mult=c(0,0.01))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank())

#!# Means by lake with points and confidence intervals

ggplot(data=gli,mapping=aes(x=lake,y=max.cover)) + #BREAK
  stat_summary(fun=mean,geom="point",) + #BREAK
  stat_summary(fun.data=mean_cl_normal,geom="errorbar",width=0.25) + #BREAK
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)") +
  theme_bw() +
  theme(panel.grid.major.x=element_blank())

#!# Means by lake with points and confidence intervals ... using geom_pointrange

ggplot(data=gli,mapping=aes(x=lake,y=max.cover)) +
  stat_summary(
    fun.data=mean_cl_normal,geom="pointrange",
    size=1, #BREAK2
    fatten=2 #BREAK3
  ) +
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)") +
  theme_bw() +
  theme(panel.grid.major.x=element_blank())

#!# Violin plot with points and mean and confidence interval

ggplot(data=gli,mapping=aes(x=lake,y=max.cover)) +
  geom_violin(color="gray30",fill="gray50",alpha=0.1,trim=FALSE) + #BREAK
  geom_jitter(data=gli,mapping=aes(x=lake,y=max.cover),
              width=0.07,size=0.5,color="black",alpha=0.25) + #BREAK
  stat_summary(fun.data=mean_cl_normal,geom="pointrange",
               size=0.75,fatten=1,pch=3,color="red") + #BREAK
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Maximum Ice Coverage (%)",
                     limits=c(0,100),expand=expansion(mult=0.01)) +
  theme_bw()

#!# Means and confidence intervals separated by lake AND decade

ggplot(data=gli,mapping=aes(
    x=lake,y=max.cover,
    color=decade #BREAK2
  )) +
  stat_summary(
    fun.data=mean_cl_normal,geom="pointrange",size=0.5,fatten=1,
    position=position_dodge(width=0.5) #BREAK3
  ) +
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)") +
  theme_bw() +
  theme(panel.grid.major.x=element_blank())

#!# Compute means by lake

sum1 <- gli %>%
  group_by(lake) %>%
  summarize(n=n(),
            mean=mean(max.cover,na.rm=TRUE))

#!# Plot means by lake ... bars from summarized data

sum1

ggplot(data=sum1,mapping=aes(x=lake,y=mean)) +
  geom_bar(stat="identity",fill="gray30",alpha=0.75) + #BREAK
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)",
                     limits=c(0,100),expand=expansion(mult=c(0,0.01))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank()) + #BREAK
  geom_text(aes(label=round(mean,1)),vjust=-0.5)

#!# Plot means by lake ... points from summarized data

sum1

ggplot(data=sum1,mapping=aes(x=lake,y=mean)) +
  geom_point(color="gray30") + #BREAK
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)") +
  theme_bw() +
  theme(panel.grid.major.x=element_blank()) + #BREAK
  geom_text(aes(label=round(mean,1)),vjust=-0.75)

#!# Compute means, SDs, SEs, and MEs by lake, add the intervals by lake

sum2 <- gli %>%
  group_by(lake) %>%
  summarize(n=n(),
            mean=mean(max.cover,na.rm=TRUE),
            sd=sd(max.cover,na.rm=TRUE)) %>% #BREAK
  mutate(se=sd/sqrt(n),
         me=qt(0.975,df=n-1)*se) %>% #BREAK
  mutate(lsd=mean-sd,usd=mean+sd,
         lse=mean-se,use=mean+se,
         lci=mean-me,uci=mean+me)

#!# Plot means and confidence intervals by lake ... bars

ggplot(data=sum2,mapping=aes(x=lake,y=mean)) + #BREAK
  geom_bar(stat="identity",fill="gray30",alpha=0.75) +
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)",
                     limits=c(0,100),expand=expansion(mult=c(0,0.01))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank()) + #BREAK
  geom_errorbar(aes(ymin=lci,ymax=uci),width=0.15)

#!# Plot means and SD intervals by lake ... points

ggplot(data=sum2,mapping=aes(x=lake,y=mean)) +
  geom_point(color="gray30") + #BREAK
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)") +
  theme_bw() +
  theme(panel.grid.major.x=element_blank()) + #BREAK
  geom_errorbar(aes(ymin=lsd,ymax=usd),width=0.15) + #BREAK
  geom_text(aes(label=round(mean,1)),hjust=-0.25)


# Script created at 2020-05-08 13:36:32
