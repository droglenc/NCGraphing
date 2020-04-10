loon <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/Loon1.csv")
str(loon)

library(ggplot2)

tb <- ggplot(data=loon,mapping=aes(x=bill.len,y=tarsus)) +
  geom_point(size=3) +
  scale_x_continuous(name="Bill Length (mm)") +
  scale_y_continuous(name="Tarsus Length (mm)") +
  theme_bw()
tb

wt <- ggplot(data=loon,mapping=aes(x=tarsus,y=weight)) +
  geom_point(size=5,color="red",shape=18,alpha=0.5) +
  scale_x_continuous(name="Tarsus Length (mm)") +
  scale_y_continuous(name="Weight (g)") +
  theme_bw()
wt

tb2 <- ggplot(data=loon,mapping=aes(x=bill.len,y=tarsus,color=region)) +
  geom_point(size=3) +
  scale_x_continuous(name="Bill Length (mm)") +
  scale_y_continuous(name="Tarsus Length (mm)") +
  theme_bw()
tb2

tb3 <- ggplot(data=loon,mapping=aes(x=bill.len,y=tarsus,color=weight)) +
  geom_point(size=3) +
  scale_x_continuous(name="Bill Length (mm)") +
  scale_y_continuous(name="Tarsus Length (mm)") +
  theme_bw()
tb3

tb4 <- ggplot(data=loon,mapping=aes(x=bill.len,y=tarsus,
                                    color=region,shape=sex)) +
  geom_point(size=3) +
  scale_x_continuous(name="Bill Length (mm)") +
  scale_y_continuous(name="Tarsus Length (mm)") +
  theme_bw()
tb4

tb5 <- tb2 +
  scale_color_manual(values=c("#000000", "#E69F00", "#56B4E9"))
tb5


# Script created at 2020-04-10 09:26:57
