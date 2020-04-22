#!# Loading the tidyverse package (must do every time)
library(tidyverse)


#!# Making some simple data for the initial ggplot examples
dfobj <- data.frame(var1=c(3,1,5),
                    var2=c(2,4,6),
                    lbls=c("a","b","c"))
dfobj

#!# Making the base ggplot
p <- ggplot(data=dfobj,mapping=aes(x=var1,y=var2))

#!# Evaluating the base ggplot (not particularly useful until a geom is added)
p

#!# Adding geoms to a base ggplot (using all defaults)
p + geom_point()

p + geom_line()

p + geom_path()

p + geom_area()

p + geom_polygon()

p + geom_tile()

p + geom_bar(stat="identity")

p + geom_text(aes(label=lbls))

p +
  geom_bar(stat="identity") +
  geom_line() +
  geom_point() +
  geom_text(aes(label=lbls),vjust=2)

# Script created at 2020-04-22 18:37:36
