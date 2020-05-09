#!# Loading the tidyverse package (must do every time)
library(tidyverse)

#!# DEREK ... delete this from the script
set.seed(3342374)
df <- data.frame(x=rnorm(15,mean=10,sd=3)) %>%
  mutate(y=3*x+2+rnorm(15,sd=5))

lm1 <- lm(y~x,data=df)

df <- df %>%
  mutate(preds=predict(lm1),
         resid=y-preds)

ggplot(data=df,mapping=aes(x=x,y=y)) +
  geom_point(aes(color=resid>0),size=1.25) +
  geom_segment(mapping=aes(xend=x,yend=preds,color=resid>0),size=0.6,linetype="dashed") +
  geom_smooth(method="lm",se=FALSE,size=1,color="black") +
  scale_x_continuous("Explanatory Variable") +
  scale_y_continuous("Response Variable") +
  scale_color_manual(values=c("FALSE"="red","TRUE"="blue")) +
  theme_bw() +
  theme(legend.position="none",panel.grid=element_blank())

#!# DEREK ... delete this from the script
set.seed(334287)
df <- df %>%
  mutate(y2=0.1*x^3-1.8*x^2-1.5*x+150+rnorm(15,sd=10))

ggplot(data=df,mapping=aes(x=x,y=y2/10,color=)) +
  geom_point(size=1.25) +
  geom_smooth(aes(color="0.5"),method="loess",se=FALSE,size=0.75,span=0.5) +
  geom_smooth(aes(color="0.75"),method="loess",se=FALSE,size=0.75,span=0.75) +
  geom_smooth(aes(color="1.5"),method="loess",se=FALSE,size=0.75,span=1.5) +
  scale_color_manual(name="Span",values=c("green3","blue","red")) +
  scale_x_continuous("Explanatory Variable") +
  scale_y_continuous("Response Variable") +
  theme_bw() +
  theme(panel.grid=element_blank())

#!# Load and Prep Data

#!# Set to your own working directory and have just your filename below.
avoc <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/Avocados.csv",
                stringsAsFactors=FALSE,quote="") %>%
  filter(region=="GreatLakes",type=="organic") %>%
  mutate(type=factor(type),year=factor(year)) %>%
  select(year,region,Total.Volume,AveragePrice)
head(avoc)

#!# Exploratory Scatter Plot

p <- ggplot(data=avoc,mapping=aes(y=Total.Volume,x=AveragePrice)) +
  geom_point(size=1.25,pch=21,color="black",fill="gray70") +
  scale_x_continuous(name="Average Price ($)") +
  scale_y_continuous(
    breaks=seq(50000,350000,50000),
    labels=scales::unit_format(unit="",scale=1e-3), #BREAK2
    name="Thousands of Bags Sold" #BREAK3
  ) +
  theme_bw() +
  theme(panel.grid.minor=element_blank())

#!# Adding a regression line

p + 
  geom_smooth(
    method="lm", #BREAK2
    color="red", #BREAK3
    fill="red", #BREAK4
    se=FALSE #BREAK5
  )

#!# create and show a palette

cbPalette <- c("#999999","#E69F00","#56B4E9","#009E73","#F0E442","#0072B2","#D55E00","#CC79A7")

scales::show_col(cbPalette)

#!# Adding a regression line for each group

p <- ggplot(data=avoc,mapping=aes(y=Total.Volume,x=AveragePrice,
                                  color=year,fill=year #BREAK2
                                  )) +
  geom_point(size=1.25,pch=21) +
  scale_x_continuous(name="Average Price ($)") +
  scale_y_continuous(name="Thousands of Bags Sold",
                     limits=c(50000,NA),breaks=seq(50000,350000,50000),
                     labels=scales::unit_format(unit="",scale=1e-3)) + 
  geom_smooth(method="lm") +
  scale_color_manual(name="Year",values=cbPalette) + #BREAK3
  scale_fill_manual(name="Year",values=cbPalette) + #BREAK4
  theme_bw() +
  theme(panel.grid.minor=element_blank())

#!# Load and Prep Data

#!# Set to your own working directory and have just your filename below.
irmw <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/WolvesMoose_IsleRoyale_June2019.csv",
                 na.strings=c("NA","N/A")) %>%
  select(year,wolves,moose,Jan.Feb..temp..F.,ice.bridges..0.none..1...present.) %>%
  rename(winter_temp=Jan.Feb..temp..F.,
         ice_bridges=ice.bridges..0.none..1...present.) %>%
  mutate(ice_bridges=plyr::mapvalues(ice_bridges,from=c(0,1),to=c("no","yes")),
         ice_bridges=factor(ice_bridges))
head(irmw)

#!# Exploratory Line Plot

mw <- ggplot(data=irmw,mapping=aes(y=moose,x=wolves)) +
  geom_point(size=1.25,pch=21,color="black",fill="gray50") +
  scale_x_continuous(name="Number of Wolves") +
  scale_y_continuous(name="Number of Moose") +
  theme_bw() +
  theme(panel.grid.minor=element_blank())

#!# Adding a loess line

mw + 
  geom_smooth(
    method="loess", #BREAK2
    color="darkorange", #BREAK3
    fill="orange", #BREAK4
    span=0.6 #BREAK5
  )

#!# Adding loess lines separated by the ice_bridges factor variable

mw2 <- ggplot(data=irmw,mapping=aes(y=moose,x=wolves,
                                   color=ice_bridges,fill=ice_bridges #BREAK3
                                   )) +
  geom_point(size=1.25,pch=21) +
  geom_smooth(method="loess",span=0.6) + #BREAK2
  scale_x_continuous(name="Number of Wolves") +
  scale_y_continuous(name="Number of Moose",limits=c(0,NA)) +
  scale_color_manual(name="Ice Bridge?",values=cbPalette) +
  scale_fill_manual(name="Ice Bridge?",values=cbPalette) + 
  theme_bw() +
  theme(panel.grid.minor=element_blank())

#!# Fitting a linear model to make predicted values of Y

lmavoc <- lm(Total.Volume~AveragePrice,data=avoc)
lmavoc

x <- seq(0.75,1.90,0.01)

y <- predict(lmavoc,data.frame(AveragePrice=x),interval="confidence")

preds <- data.frame(x,y)
head(preds)

#!# Scatterplot with the predicted values overlaid

head(avoc,n=3)
head(preds,n=3) #BREAK

ggplot() +
  geom_point(data=avoc,mapping=aes(y=Total.Volume,x=AveragePrice),
             size=1.25,pch=21,color="black",fill="gray70") + #BREAK
  geom_line(data=preds,mapping=aes(y=fit,x=x),
            size=1,color="blue") + #BREAK
  scale_x_continuous(name="Average Price ($)") +
  scale_y_continuous(name="Thousands of Bags Sold",
                     breaks=seq(50000,350000,50000),
                     labels=scales::unit_format(unit="",scale=1e-3)) +
  theme_bw() +
  theme(panel.grid.minor=element_blank())

#!# Scatterplot with the fitted values and confidence band overlaid

head(avoc,n=3)
head(preds,n=3) #BREAK

ggplot() +
  geom_ribbon(data=preds,mapping=aes(x=x,ymin=lwr,ymax=upr),
              fill="blue",alpha=0.25) + #BREAK
  geom_point(data=avoc,mapping=aes(y=Total.Volume,x=AveragePrice),
             size=1.25,pch=21,color="black",fill="gray70") + #BREAK
  geom_line(data=preds,mapping=aes(y=fit,x=x),
            size=1,color="blue") + #BREAK
  scale_x_continuous(name="Average Price ($)") +
  scale_y_continuous(name="Thousands of Bags Sold",
                     breaks=seq(50000,350000,50000),
                     labels=scales::unit_format(unit="",scale=1e-3)) +
  theme_bw() +
  theme(panel.grid.minor=element_blank())

#!# Logistic Regression Example

bm <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/Batmorph.csv")

logreg <- glm(subsp~canine,data=bm,family="binomial")
logreg

x <- seq(0.250,0.375,length.out=200)
y <- predict(logreg,data.frame(canine=x),type="response",se=TRUE)
preds <- data.frame(x,y)
head(preds)

head(bm,n=3)
head(preds,n=3) #BREAK

ggplot() +
  geom_ribbon(data=preds,mapping=aes(x=x,
                                     ymin=fit-2*se.fit,
                                     ymax=fit+2*se.fit),
              fill="blue",alpha=0.25) + #BREAK
  geom_line(data=preds,mapping=aes(x=x,y=fit),color="blue",size=1) + #BREAK
  geom_point(data=bm,mapping=aes(x=canine,y=as.numeric(subsp)-1),
             size=1.5,alpha=0.25) + #BREAK
  scale_x_continuous(name="Canine Tooth Height (cm)",
                     expand=expansion(mult=0)) +
  scale_y_continuous(name="Probability of Semotus",
                     expand=expansion(mult=0.01)) +
  theme_bw() +
  theme(panel.grid.minor=element_blank())


# Script created at 2020-05-09 17:44:44
