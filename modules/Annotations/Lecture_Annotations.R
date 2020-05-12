#!# Loading the tidyverse package (must do every time)
library(tidyverse)
library(gghighlight)
library(ggrepel)

#!# DEREK ... delete this from the script.

ggplot(data=data.frame(x=1,y=1),mapping=aes(x=x,y=y)) +
  geom_point(color="white") +
  theme_bw() + theme(panel.grid=element_blank()) +
  scale_x_continuous(limits=c(0,2),breaks=0:2,expand=expansion(mult=0)) +
  scale_y_continuous(limits=c(0,2),breaks=0:2,expand=expansion(mult=0)) +
  labs(title="This is the MAIN title.",
       subtitle="and this is the SUBtitle.",
       caption="You can put a CAPTION here.",
       tag="TAG",
       x="X-axis label goes here",
       y="Y-xxis label goes here") +
  theme(plot.title=element_text(color="red"),
        plot.subtitle=element_text(color="red"),
        axis.title=element_text(color="red"),
        plot.caption=element_text(color="red"),
        plot.tag=element_text(color="red"))

#!# Load and Prep Data

#!# Set to your own working directory and have just your filename below.
irmw <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/WolvesMoose_IsleRoyale_June2019.csv",
                 na.strings=c("NA","N/A"))  %>%
  select(year,wolves,moose) %>%
  mutate(parvo=ifelse(year>1980,"Post-parvo","Pre-parvo"),
         parvo=factor(parvo,levels=c("Pre-parvo","Post-parvo")))

#!# Demonstrating labs() with IR wolf plot

ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_line(color="gray70") +
  geom_point(aes(fill=parvo),size=1.25,pch=21) +
  scale_fill_manual(values=c("Pre-parvo"="white","Post-parvo"="black")) +
  scale_y_continuous(limits=c(0,NA),expand=expansion(mult=c(0,0.04))) +
  scale_x_continuous(expand=expansion(mult=0.04)) +
  theme_bw() +
  theme(panel.grid.minor=element_blank()) + #BREAK
  labs(title="Number of Wolves on Isle Royale, 1959-2019",
       subtitle="Estimated from aerial counts",
       caption="Source: https://isleroyalewolf.org") + #BREAK
  labs(x=element_blank(),
       y=element_blank(),
       fill="Relative to Parvo")

#!# Demonstrating annotate() with IR wolf plot

ggplot(data=irmw,mapping=aes(x=year,y=wolves)) +
  geom_line(color="gray70") +
  geom_point(aes(fill=parvo),size=1.25,pch=21) +
  scale_fill_manual(values=c("Pre-parvo"="white","Post-parvo"="black")) +
  scale_y_continuous(limits=c(0,NA),expand=expansion(mult=c(0,0.04))) +
  scale_x_continuous(expand=expansion(mult=0.04)) +
  theme_bw() +
  theme(panel.grid.minor=element_blank(),legend.position="none") +
  labs(title="Number of Wolves on Isle Royale, 1959-2019",
       subtitle="Estimated from aerial counts",
       caption="Source: https://isleroyalewolf.org",
       x=element_blank(),y=element_blank()) + #BREAK
  annotate(geom="label",x=1990,y=48,hjust="left",
           label="Outbreak of parvovirus in 1980") + #BREAK
  annotate(geom="segment",x=1990,y=48,xend=1980.5,yend=50,size=0.25,
           arrow=arrow(length=unit(2,"mm"),angle=15,type="closed")) + #BREAK
  annotate(geom="label",x=2014,y=37,hjust="right",
           label="Wolves introduced from mainland") + #BREAK
  annotate(geom="curve",x=2014,y=37,xend=2019,yend=15.5,size=0.25,
           arrow=arrow(length=unit(2,"mm"),angle=15,type="closed"),
           curvature=-0.25) + #BREAK
  annotate(geom="segment",x=2008,xend=2013.5,y=18.5,yend=1,
           color="steelblue") + #BREAK
  annotate(geom="text",x=2003,y=8,color="steelblue",
           label="Concerned about\ninbreeding suppression")

#!# Load Great Lakes ice data and compute means by lake
gli <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/GreatLakesIce.csv") %>%
  mutate(lake=factor(lake,levels=c("Superior","Michigan","Huron","Erie","Ontario")),
         decade=floor(year/10)*10,
         decade=factor(paste0(decade,"s"),levels=c("1970s","1980s","1990s","2000s","2010s")))

sum1 <- gli %>%
  group_by(lake) %>%
  summarize(n=n(),mn=mean(max.cover,na.rm=TRUE),
            s=sd(max.cover,na.rm=TRUE)) %>%
  mutate(lci=mn-qt(0.975,df=n-1)*s/sqrt(n),uci=mn+qt(0.975,df=n-1)*s/sqrt(n))

#!# Plot means by lake ... with means displayed

sum1

ggplot(data=sum1,mapping=aes(x=lake,y=mn)) +
  geom_bar(stat="identity",fill="gray30",alpha=0.75) +
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)",
                     limits=c(0,NA),expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank()) + #BREAK
  geom_text(aes(label=round(mn,1)),vjust="bottom",nudge_y=1)

#!# Find significance letters

aov <- lm(max.cover~lake,data=gli)
anova(aov)
library(multcomp)
mc1 <- glht(aov,mcp(lake="Tukey"))
cld(mc1)

#!# Plot means by lake ... with CIs and confidence letters displayed

sum1

ggplot(data=sum1,mapping=aes(x=lake,y=mn)) +
  geom_bar(stat="identity",fill="gray30",alpha=0.75) +
  geom_errorbar(mapping=aes(ymin=lci,ymax=uci),width=0.1) +
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)",
                     limits=c(0,NA),expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank()) + #BREAK
  geom_text(mapping=aes(y=uci,label=c("b","a","b","c","a")),
            vjust="bottom",nudge_y=1.5)

#!# Plot means by lake ... with sample size displayed

sum1

ggplot(data=sum1,mapping=aes(x=lake,y=mn)) +
  geom_bar(stat="identity",fill="gray30",alpha=0.75) +
  geom_errorbar(mapping=aes(ymin=lci,ymax=uci),width=0.1) +
  scale_x_discrete(name="Great Lake") +
  scale_y_continuous(name="Mean Maximum Ice Coverage (%)",
                     limits=c(0,NA),expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank()) +
  geom_text(mapping=aes(y=uci,label=c("b","a","b","c","a")),
            vjust="bottom",nudge_y=1.5) + #BREAK
  geom_text(mapping=aes(y=0,label=paste("n =",n)),
            vjust="bottom",nudge_y=1.5)

#!# Prepare IR wolf-moose data

irmw2 <- irmw %>%
  filter(year>=1970,year<=1990) %>%
  mutate(year5=ifelse(year %in% seq(1970,1990,5),year,""),moose.next=c(moose[-1],NA),wolves.next=c(wolves[-1],NA))

#!# DEREK ... delete this in the script

ggplot(data=irmw2,mapping=aes(x=moose,y=wolves)) + #BREAK
  geom_segment(mapping=aes(xend=moose.next,yend=wolves.next,color=year),
               size=0.4,
               arrow=arrow(length=unit(2,"mm"),angle=15,type="closed"))

#!# Create base IR moose-wolf plot

p <- ggplot(data=irmw2,mapping=aes(x=moose,y=wolves)) +
  geom_segment(mapping=aes(xend=moose.next,yend=wolves.next,color=year),
               size=0.4,
               arrow=arrow(length=unit(2,"mm"),angle=15,type="closed")) + #BREAK
  geom_point(size=1.2) +
  labs(title="Isle Royale Wolf and Moose Abundance, 1970-1990",
       subtitle="Parvovirus outbreak in 1980",
       x="Moose Abundance",y="Wolf Abundance",
       caption="Source: https://isleroyalewolf.org") +
  theme_bw() + theme(panel.grid=element_blank(),legend.position="none",
                     aspect.ratio=1) + #BREAK
  geom_point(data=filter(irmw,year==1980),color="red",size=1.2)

#!# DEREK ... delete this in the script

p +
  geom_text(mapping=aes(label=year))

#!# Base IR moose-wolf plot with good labels added

p +
  geom_text(
    mapping=aes(label=year5),
    vjust="bottom", #BREAK2
    nudge_y=1 #BREAK3
    )


# Script created at 2020-05-12 11:32:14
