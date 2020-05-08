wdf <- data.frame(question=LETTERS[1:7],
                  F=c(160, 90,  0,  0,100,  0,450),
                  D=c(180,130,170,  0,325,400,  0),
                  C=c(200,400,460,800,  0,  0,  0),
                  B=c(220,250,370,200,425,600,  0),
                  A=c(240,130,  0,  0,150,  0,550))

ldf <- tidyr::pivot_longer(wdf,cols=2:6,names_to="response",values_to="freq") %>%
  mutate(response=factor(response,levels=c("F","D","C","B","A")),
         respval=as.numeric(response))

## Check sample size and "mean" by scenario
ldf %>%
  group_by(question) %>%
  summarize(n=sum(freq),
            mean=sum(freq*respval)/n)

## Calculate percents within a question
sum <- ldf %>%
  group_by(question) %>%
  mutate(perc=freq/sum(freq))
sum

## Bar chart by scenario
ggplot(data=sum,mapping=aes(x=response,y=perc)) +
  geom_bar(stat="identity") +
  scale_y_continuous(name="Frequency of Respondents",
                     expand=expansion(mult=c(0,0.05)),
                     breaks=seq(0,1,0.25),
                     labels=scales::label_percent(accuracy=1)) +
  scale_x_discrete(name="Respondent's Answer",
                   labels=paste0(c("F","D","C","B","A")," (",1:5,")")) +
  facet_grid(rows=vars(question),scales="free_y") +
  theme_bw() +
  theme(panel.grid=element_blank())

## Tile plot by scenario
ggplot(data=sum,mapping=aes(x=response,y=forcats::fct_rev(question),fill=perc)) +
  geom_tile() +
  scale_fill_gradient2(low="aquamarine",high="aquamarine4") +  
  geom_text(aes(label=paste0(round(perc*100,0),"%"))) +  
  scale_y_discrete(name="Question",expand=expansion(mult=0)) +  
  scale_x_discrete(name="Respondent's Answer",,expand=expansion(mult=0)) +  
  theme_minimal() +  
  theme(legend.position="none",aspect.ratio=1)

