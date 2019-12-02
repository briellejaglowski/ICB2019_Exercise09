library(ggplot2)
library(cowplot)

#1


#2
da=read.csv("data.txt", stringsAsFactors = F, header=T)

#bar plot
a=ggplot(data=da, aes(x=region, y=observations))+
  theme_bw()+theme(panel.grid = element_blank())+ 
  xlab("Region")+ylab("Observations")

means=aggregate(formula=observations~region, data=da, FUN = mean)
b=a+stat_summary(fun.y=mean, geom="bar", aes(fill=region, color=region), alpha=0.5)+
  stat_summary(fun.data=mean_se, geom="errorbar", width=0.4)+
  guides(fill=FALSE, color=FALSE)+
  geom_text(data = means, aes(label= round(observations), y = observations + 1))
b

#scatter plot
s=a+geom_jitter(aes(color=region), alpha=0.25, size=2)+
  guides(color=FALSE)
s

#Answer: Yes, the bar and scatter plots do tell different stories.
#The scatter plot shows the distributions of the data, which is not apparent when the data is represented as bars instead.