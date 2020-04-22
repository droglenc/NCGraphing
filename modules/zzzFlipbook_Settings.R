library(flipbookr)
library(tidyverse)
options(width=120,show.signif.stars=FALSE)
splitPerc <- 50
leftAssign <- TRUE

library(xaringanthemer)
xaringanthemer::mono_accent(
  base_color = "#162135",
  header_font_google = google_font("Montserrat"),
  text_font_google   = google_font("Robot", "200", "200i"),
  code_font_google   = google_font("Inconsolata"),
  text_color = "black",
  text_font_size = ".7cm",
  code_font_size = ".7cm",
  text_slide_number_color="#cfcecc",
  text_slide_number_font_size=".4cm",
  extra_css=list(
    ".remark-code"=list("line-height"="1.5","font-size"="60%"),
    ".remark-slide-content"=list("font-size"="24px","padding"="1em 4em 1em 4em"),
    "code.r"=list("font-weight"="bold"),
    "pre"=list("font-weight"="bold"),
    "body"=list("font-weight"="400")
  ),
  outfile="zlibs/xaringan-themer.css"
)
