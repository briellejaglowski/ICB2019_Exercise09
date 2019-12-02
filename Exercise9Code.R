library(ggplot2)
library(cowplot)

#1


#2
da=read.csv("data.txt", stringsAsFactors = F, header=T)

#bar plot
a=ggplot(data=da, aes(x=region, y=observations))+
  theme_bw()+theme(panel.grid = element_blank())+ 
  xlab("Region")+ylab("Observations")
