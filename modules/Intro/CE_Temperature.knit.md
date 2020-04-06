---
layout: page
title: Exercise -- Temperature
author: Derek H. Ogle
css: "/css/modules.css"
output:
  html_document:
    self_contained: false
    lib_dir: zlibs
---





----

## Background
<img src="loon.jpg" alt="Common Loon" class="img-right">
The National Oceanic and Atmpospheric Administration (NOAA) maintains a database of global land and sea temperatures. The data can be accessed from their [Climate at a Glance website](https://www.ncdc.noaa.gov/cag/global/time-series). Their defaut settings show the *global* temperature anomaly (difference from a long-term average) for *February*. These data can be downloaded from their website with the following code.


```r
gt <- read.csv("https://www.ncdc.noaa.gov/cag/global/time-series/globe/land_ocean/1/2/1880-2020/data.csv",skip=4)
```


## Annual Temperatue Anomaly 1
Construct `ggplot2` code to match the graph below (as closely as you can).

<img src="CE_Temperature_files/figure-html/Temperture_1-1.png" width="480" />


## Annual Temperatue Anomaly 2
Construct `ggplot2` code to match the graph below (as closely as you can).

<img src="CE_Temperature_files/figure-html/Temperature_2-1.png" width="480" />


## BONUS -- Annual Temperatue Anomaly 3
Construct `ggplot2` code to match the graph below (as closely as you can).

<img src="CE_Temperature_files/figure-html/Temperature_3-1.png" width="480" />
