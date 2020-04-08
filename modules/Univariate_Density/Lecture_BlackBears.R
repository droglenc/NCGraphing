library(tidyverse)

flbb <- readxl::read_excel("fwma-08-01-02_table s1.xls") %>%
  rename(sex=SEX,age=`AGE (yr)`,length=`BODY LENGTH (cm)`,
         weight=`BODY WEIGHT (kg)`,chest=`CHEST GIRTH (cm)`) %>%
  mutate(sex=plyr::mapvalues(sex,from=c("FEMALE","MALE"),to=c("Female","Male")),
         sex=factor(sex))

head(flbb)

h <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_histogram(binwidth=10,boundary=0,closed="left",
                 color="gray30",fill="gray70") +
  scale_x_continuous(name="Weight (kg)",breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Frequency of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())
h

p <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_histogram() +
  scale_y_continuous(name="Frequency of Bears") +
  scale_x_continuous(name="Weight (kg)",
                     breaks=seq(0,250,25)) +
  theme_bw()

p <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_histogram(
    color="gray30", #BREAK2
    fill="gray70", #BREAK3
    binwidth=10, #BREAK4
    boundary=0,closed="left" #BREAK5
  ) +
  scale_y_continuous(
    name="Frequency of Bears",
    expand=expansion(mult=c(0,0.05)) #BREAK6
  ) +
  scale_x_continuous(
    name="Weight (kg)",breaks=seq(0,250,25),
    expand=expansion(mult=c(0,0)) #BREAK7
  ) +
  theme_bw()

p <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_histogram(color="gray30",fill="gray70",
                 binwidth=10,boundary=0,closed="left") +
  scale_y_continuous(name="Frequency of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  scale_x_continuous(name="Weight (kg)",breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  theme_bw() + #BREAK
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())  

p <- ggplot(data=flbb,mapping=aes(
              x=weight,
              color=sex, #BREAK2
              fill=sex #BREAK3
            )) +
  geom_histogram(binwidth=10,boundary=0,closed="left",
                 alpha=0.25 #BREAK4
  ) +
  scale_y_continuous(name="Frequency of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  scale_x_continuous(name="Weight (kg)",breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

p <- ggplot(data=flbb,
            mapping=aes(x=weight,color=sex,fill=sex)) +
  geom_histogram(binwidth=10,boundary=0,closed="left",
                 alpha=0.25) +
  scale_y_continuous(name="Frequency of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  scale_x_continuous(name="Weight (kg)",breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank()) + #BREAK
  scale_color_manual(values=c("red3","blue3")) + #BREAK
  scale_fill_manual(values=c("red3","blue3"))

h2 <- p # for boxplots later

d <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_density(color="gray30",fill="gray30",alpha=0.25) +
  scale_x_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Relative Density of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())
h <- h + scale_x_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0)))
d / h

p <- ggplot(data=flbb, mapping=aes(x=weight)) +
  geom_density(
    color="gray30", #BREAK2
    fill="gray30", #BREAK3
    alpha=0.25 #BREAK4
  ) +
  scale_x_continuous(
    name="Weight (kg)",
    breaks=seq(0,250,25),expand=expansion(mult=c(0,0)),
    limits=c(0,250), #BREAK5
  ) +
  scale_y_continuous(name="Relative Density of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

p <- ggplot(data=flbb, mapping=aes(
  x=weight,
  color=sex, #BREAK2
  fill=sex #BREAK3
  )) +
  geom_density(
    alpha=0.25,
    position="stack" #BREAK6
  ) +
  scale_x_continuous(name="Weight (kg)",
                     breaks=seq(0,250,25),limits=c(0,250),
                     expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Relative Density of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  scale_color_manual(values=c("red3","blue3")) + #BREAK4
  scale_fill_manual(values=c("red3","blue3")) + #BREAK5
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

b <- ggplot(data=flbb, mapping=aes(x=weight,y=sex,color=sex,fill=sex)) +
  geom_boxplot(alpha=0.25) +
  scale_x_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  scale_color_manual(values=c("red3","blue3")) +
  scale_fill_manual(values=c("red3","blue3")) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())
b / h2 & theme(legend.position="none")

p <- ggplot(data=flbb, mapping=aes(x=weight,y=sex,
                                   color=sex,fill=sex)) +
  geom_boxplot(alpha=0.25) +
  scale_x_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  scale_color_manual(values=c("red3","blue3")) +
  scale_fill_manual(values=c("red3","blue3")) +
  theme_bw() +
  theme(legend.position="none")

p <- ggplot(data=flbb, mapping=aes(x=weight,y=sex)) +
  geom_boxplot(fill="gray30",alpha=0.25) +
  scale_x_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  theme_bw() +
  theme(legend.position="none") +
  coord_flip()

v <- ggplot(data=flbb, mapping=aes(x=weight,y=sex,color=sex,fill=sex)) +
  geom_violin(alpha=0.25,trim=FALSE) +
  scale_x_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  scale_color_manual(values=c("red3","blue3")) +
  scale_fill_manual(values=c("red3","blue3")) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

d2 <- ggplot(data=flbb, mapping=aes(x=weight,color=sex,fill=sex)) +
  geom_density(alpha=0.25) +
  scale_x_continuous(name="Weight (kg)",
                     breaks=seq(0,250,25),limits=c(0,250),
                     expand=expansion(mult=c(0,0))) +
  scale_y_continuous(name="Relative Density of Bears",
                     expand=expansion(mult=c(0,0.05))) +
  scale_color_manual(values=c("red3","blue3")) + #BREAK4
  scale_fill_manual(values=c("red3","blue3")) + #BREAK5
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank())

v / d2 & theme(legend.position="none")

p <- ggplot(data=flbb, mapping=aes(x=weight,y=sex)) +
  geom_violin(fill="gray30",alpha=0.25,trim=FALSE) + #BREAK
  geom_jitter(width=0,height=0.05) + #BREAK
  scale_x_continuous(name="Weight (kg)",
                     limits=c(0,250),breaks=seq(0,250,25),
                     expand=expansion(mult=c(0,0))) +
  theme_bw() +
  theme(legend.position="none") + #BREAK
  coord_flip()


# Script created at 2020-04-08 13:09:23
