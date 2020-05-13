library(tidyverse)

irmw <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/WolvesMoose_IsleRoyale_June2019.csv",
                 na.strings=c("NA","N/A"))  %>%
  select(year,wolves,moose) %>%
  mutate(parvo=ifelse(year>1980,"Post-parvo","Pre-parvo"),
         parvo=factor(parvo,levels=c("Pre-parvo","Post-parvo"))) %>%
  filter(year>=1970,year<=1990) %>%
  mutate(year5=ifelse(year %in% seq(1970,1990,5),year,""),moose.next=c(moose[-1],NA),wolves.next=c(wolves[-1],NA))


#!# Create base IR moose-wolf plot
ggplot(data=irmw,mapping=aes(x=moose,y=wolves)) +
  geom_segment(mapping=aes(xend=moose.next,yend=wolves.next,color=year),
               size=0.75,arrow=arrow(length=unit(3,"mm"),angle=15,type="closed")) +
  geom_point(mapping=aes(fill=parvo),pch=21,size=3) +
  scale_fill_manual(values=c("Pre-parvo"="white","Post-parvo"="black")) +
  labs(title="Isle Royale Wolf and Moose Abundance, 1970-1990",
       subtitle="Parvovirus outbreak in 1980",
       x="Moose Abundance",y="Wolf Abundance",
       caption="Source: https://isleroyalewolf.org") +
  theme_bw() + theme(panel.grid=element_blank(),legend.position="none",
                     aspect.ratio=1) +
  geom_point(data=filter(irmw,year==1980),color="red",size=3) +
  geom_text(mapping=aes(label=year5),vjust="bottom",nudge_y=1.2,nudge_x=5)

ggsave("Plot_for_PR.pdf",path="modules/Annotations/",width=6,height=6)
