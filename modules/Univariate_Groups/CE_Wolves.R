library(tidyverse)
lvls_agree <- c("Strongly Disagree","Disagree","Neutral","Agree","Strongly Agree")
sow <- read.csv("https://derekogle.com/NCGraphing/modules/zdata/StateOfWolf.csv") %>%
  select(state,hunt_deer,seen_wolf,part_deer,
         ad_healthy_deer,ad_nowolves_deer,ad_threaten_deer,ad_deer_hunting) %>%
  filter(complete.cases(.)) %>%
  mutate(part_deer=factor(part_deer,
          levels=c("Stop Participating","Participate Less Frequently",
                   "Participate More Frequently","No Changes")),
         ad_healthy_deer=factor(ad_healthy_deer,levels=lvls_agree),
         ad_nowolves_deer=factor(ad_nowolves_deer,levels=lvls_agree),
         ad_threaten_deer=factor(ad_threaten_deer,levels=lvls_agree),
         ad_deer_hunting=factor(ad_deer_hunting,levels=lvls_agree)) %>%
  filter(hunt_deer=="Yes")

ngdh1 <- ggplot(data=sow,mapping=aes(x=ad_deer_hunting)) +
  geom_bar(color="gray30",fill="wheat") +
  scale_x_discrete(name="Level of Agreement") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
ngdh1

NGDHst1 <- ggplot(data=sow,mapping=aes(x=state,fill=ad_deer_hunting)) +
  geom_bar(color="gray30",alpha=0.7) +
  scale_x_discrete(name="State") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Agreement",
                    values=c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2")) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
NGDHst1

NGDHst2 <- ggplot(data=sow,mapping=aes(x=state,fill=ad_deer_hunting)) +
  geom_bar(color="gray30",alpha=0.7) +
  scale_x_discrete(name="State") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Agreement",
                    values=c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2")) +
  coord_flip() +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
NGDHst2

sum1 <- sow %>%
  group_by(ad_deer_hunting) %>%
  summarize(freq=n()) %>%
  ungroup()

ngdh2 <- ggplot(data=sum1,mapping=aes(x=ad_deer_hunting,y=freq)) +
  geom_bar(stat="identity",color="gray30",fill="wheat") +
  scale_x_discrete(name="Level of Agreement") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
ngdh2

sum2 <- sow %>%
  group_by(state,ad_deer_hunting) %>%
  summarize(freq=n()) %>%
  mutate(perc=freq/sum(freq)*100) %>%
  ungroup()
  
NGDHst3 <- ggplot(data=sum2,mapping=aes(x=state,y=freq,fill=ad_deer_hunting)) +
  geom_bar(stat="identity",color="gray30",alpha=0.7) +
  scale_x_discrete(name="State") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Agreement",
                    values=c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2")) +
  coord_flip() +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
NGDHst3

NGDHst4 <- ggplot(data=sum2,mapping=aes(x=state,y=perc,fill=ad_deer_hunting)) +
  geom_bar(stat="identity",color="gray30",alpha=0.7) +
  scale_x_discrete(name="State") +
  scale_y_continuous(name="Percent of Respondents",
                     expand=expansion(mult=c(0,0.05))) +
  scale_fill_manual(name="Agreement",
                    values=c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2")) +
  coord_flip() +
  theme_bw() +  
  theme(panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank())
NGDHst4


# Script created at 2020-04-13 15:46:56
