library(dplyr)

setwd("C:/aaaWork/Web/GitHub/NCGraphing/modules/zdata/")
df <- readspss::read.spss("raw/Schanning_StateOfTheWolf.sav") %>%
  select(-VAR00001,-VAR00002)
lup <- read.csv("raw/Schanning_StateOfTheWOlf_LOOKUP.csv",stringsAsFactors=FALSE)

df$v19[df$v19=="99"] <- NA_character_
df$v19 <- factor(df$v19)

df$v26[df$v26=="9"] <- NA_character_
df$v26 <- factor(df$v9)

df$v27[df$v27=="0"] <- NA_character_
df$v27 <- factor(df$v27)

df$v50[df$v50 %in% c("0","99")] <- NA_character_
df$v50 <- factor(df$v50)

df$v100[df$v100 %in% c("2","3","4")] <- NA_character_
df$v100 <- factor(df$v100)

df$v101[df$v101=="0"] <- NA_character_
df$v101 <- factor(df$v101)

df$v102[df$v102 %in% c("2","3","4")] <- NA_character_
df$v102 <- factor(df$v102)

df$v103[df$v103=="0"] <- NA_character_
df$v103 <- factor(df$v103)

df$v105[df$v105=="5"] <- NA_character_
df$v105 <- factor(df$v105)

df$v106[df$v106=="4"] <- NA_character_
df$v106 <- factor(df$v106)

df$v118[df$v118=="5"] <- NA_character_
df$v118 <- factor(df$v118)

df$v119[df$v119 %in% c("4","5")] <- NA_character_
df$v119 <- factor(df$v119)

df$v121[df$v121 %in% c("2","3","4","5")] <- NA_character_
df$v121 <- factor(df$v121)

df$v129[df$v129=="0"] <- NA_character_
df$v129 <- factor(df$v129)

df$v130[df$v130=="0"] <- NA_character_
df$v130 <- factor(df$v130)

df$v143[df$v143 %in% c("2","3","4","5")] <- NA_character_
df$v143 <- factor(df$v143)

df$v145[df$v145=="0"] <- NA_character_
df$v145 <- factor(df$v145)

df$v147[df$v147 %in% c("2","3","4","5")] <- NA_character_
df$v147 <- factor(df$v147)

df$v163[df$v163=="0"] <- NA_character_
df$v163 <- factor(df$v163)

df$v164[df$v164=="0"] <- NA_character_
df$v164 <- factor(df$v164)

df$v165[df$v165=="99"] <- NA_character_
df$v165 <- factor(df$v165)

df$v166[df$v166 %in% c("2","3","4","5","6")] <- NA_character_
df$v166 <- factor(df$v166)

df$v168[df$v168=="99"] <- NA_character_
df$v168 <- factor(df$v168)

df$v169[df$v169=="9"] <- NA_character_
df$v169 <- factor(df$v169)

df$v174[df$v174 %in% c("0","99")] <- NA_character_
df$v174 <- factor(df$v174)

df$v175[df$v175=="99"] <- NA_character_
df$v175 <- factor(df$v175)

df$v176[df$v176 %in% c("2","3","4")] <- NA_character_
df$v176 <- factor(df$v176)

df$v200[df$v200=="0"] <- NA_character_
df$v200 <- factor(df$v200)

df$v202[df$v202 %in% c("2","3","4","5","6")] <- NA_character_
df$v202 <- factor(df$v202)

df$v209[df$v209=="99"] <- NA_character_
df$v209 <- factor(df$v209)

df$v210[df$v210=="0"] <- NA_character_
df$v210 <- factor(df$v210)

df$v212[df$v212 %in% c("2","3")] <- NA_character_
df$v212 <- factor(df$v212)

df$v216[df$v216=="99"] <- NA_character_
df$v216 <- factor(df$v216)

df$v217[df$v217=="99"] <- NA_character_
df$v217 <- factor(df$v217)

df$v221[df$v221=="9"] <- NA_character_
df$v221 <- factor(df$v221)

df$v222[df$v222=="9"] <- NA_character_
df$v222 <- factor(df$v222)

df$v223[df$v223=="9"] <- NA_character_
df$v223 <- factor(df$v223)

df$v224[df$v224=="9"] <- NA_character_
df$v224 <- factor(df$v224)

df$v225[df$v225=="9"] <- NA_character_
df$v225 <- factor(df$v225)

df$v226[df$v226=="9"] <- NA_character_
df$v226 <- factor(df$v226)

df$v227[df$v227=="9"] <- NA_character_
df$v227 <- factor(df$v227)

attributes(df) <- NULL
df <- as.data.frame(df)
names(df) <- lup$new
head(df)

write.csv(df,"StateOfWolf.csv",quote=TRUE,row.names=FALSE)
