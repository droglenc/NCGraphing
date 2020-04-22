#!# Loading the tidyverse package (must do every time)

library(tidyverse)

#!# DEREK -- Delete this for the script

irmw <- read.csv("https://raw.githubusercontent.com/droglenc/NCData/master/WolvesMoose_IsleRoyale_June2019.csv",na.strings=c("NA","N/A")) %>%
  select(year,wolves,moose,Jan.Feb..temp..F.,ice.bridges..0.none..1...present.) %>%
  rename(winter_temp=Jan.Feb..temp..F.,
         ice_bridges=ice.bridges..0.none..1...present.) %>%
  mutate(ice_bridges=plyr::mapvalues(ice_bridges,from=c(0,1),to=c("no","yes")),
         ice_bridges=factor(ice_bridges)) %>%
  as.data.frame()
slice(irmw,1:10)

#!# Making some simple data for the initial ggplot examples

dfobj <- data.frame(var1=c(3,1,5),
                    var2=c(2,4,6),
                    lbls=c("a","b","c"))
dfobj

#!# Making the base ggplot

p <- ggplot(data=dfobj,
            mapping=aes(x=var1,y=var2))

#!# Evaluating the base ggplot (not particularly useful until a geom is added)

p

#!# Adding geoms to a base ggplot (using all defaults)

dfobj #BREAK

p + #BREAK
  geom_point()

dfobj

p + #BREAK
  geom_line()

dfobj

p +
  geom_path()

dfobj

p +
  geom_area()

dfobj

p +
  geom_polygon()

dfobj

p +
  geom_tile()

dfobj

p +
  geom_bar(stat="identity")

dfobj

p +
  geom_text(aes(label=lbls))

p +
  geom_bar(stat="identity") +
  geom_line() +
  geom_point() +
  geom_text(aes(label=lbls),vjust=2)


# Script created at 2020-04-22 18:24:52
