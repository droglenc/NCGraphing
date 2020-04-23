#!# Loading the tidyverse package (must do every time)
library(tidyverse)

#!# Load and Prep Data
#!# Set to your own working directory and have just your filename below.
df <- read.csv("http://derekogle.com/NCGraphing/modules/Intro1/Geoms_Example.csv")
df

#!# Make the base plot
p <- ggplot(data=df,mapping=aes(x=lon,y=lat))

#!# Adding the "usual" geoms
p + geom_point()
p + geom_line()
p + geom_path()
p + geom_area()
p + geom_polygon()
p + geom_tile()
p + geom_bar(stat="identity")
p + geom_text(aes(label=let))

#!# Trying some "new" geoms
p + geom_density_2d()
p + geom_hex()
p + geom_step()
p + geom_rug()
p + geom_label(aes(label=let))

#!# Putting geoms together
p + geom_point() + geom_rug()
p + geom_point() + geom_density_2d()
p + geom_point() + geom_hex()
p + geom_line() + geom_text(aes(label=let))


# Script created at 2020-04-23 10:36:12
