---
######!!!!! DO NOT SAVE THIS AS TEMPLATE.Rmd ... GIVE IT A NEW NAME !!!!!######
title: "Untitled"   ## Don't change next thirteen lines
author: "XXX"
date: "`r format(Sys.time(), '%d %B, %Y')`"
output: 
  html_document:
    theme: yeti
    highlight: pygments
    code_folding: hide
---

```{r setup, echo=FALSE, message=FALSE, warning=FALSE}
knitr::opts_chunk$set(echo=TRUE,fig.width=5,fig.height=5,comment="#R>")
```


<!---- You can edit anything below here ---->

# Packages and Data
```{r packages, message=FALSE, warning=FALSE}
library(tidyverse)
```

```{r data, echo=-1}
## Initially load data here
df <- read.csv("XXX.csv")
str(df)
```


# SECTION TITLE

```{r}
```

