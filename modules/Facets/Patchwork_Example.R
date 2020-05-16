dfobj <- data.frame(var1=c(3,1,5),
                    var2=c(2,4,6),
                    lbls=c("a","b","c"))
dfobj

#!# Making the base ggplot
p <- ggplot(data=dfobj,mapping=aes(x=var1,y=var2))

pt <- p + geom_point()
ln <- p + geom_line()
ph <- p + geom_path()
ar <- p + geom_area()
po <- p + geom_polygon()
tl <- p + geom_tile()
br <- p + geom_bar(stat="identity")
tx <- p + geom_text(aes(label=lbls))

library(patchwork)
pt + ln

pt + ln + ph + ar

pt + ln / ph + ar

pt + ln + ph + ar + po + tl + br +tx +
  plot_layout(ncol=4,nrow=2)

pt + ln + ph + ar + po + tl + br +tx +
  plot_layout(ncol=4,nrow=2) +
  plot_annotation(title="Composite Graph", tag_levels="1")

