### new ggplot codes  
rm(list=ls())
setwd("/Users/AD/Dropbox/MEEV/3. US influenza Kaja and Gloria")
datfull<-read.csv("/Users/AD/Documents/GitHub/Influenza/df/icer-all.csv")

### this is to order the facet columns the same way as the original figure
datfull$risk_f = factor(datfull$risk, levels=c('High','Non-high','All'))
### this is to order the legend 
datfull$age <- factor(datfull$age, levels = c("0-4 yrs","5-19 yrs","20-64 yrs","65+ yrs","All"))

f4 <- ggplot(subset(datfull,scenario %in% "vaxbase"), aes(y=cost.diff.per100k, x=dalys.averted.per100k, group=age, colour=age))+
  geom_point()+
  expand_limits(y=0) +
  labs(y="Cost saved per 100,000 population\n", x="\nDALYs averted per 100,000 population", color="Age group")+ 
    theme_bw() +
  # theme(axis.text=element_text(size=10),
  #       axis.title=element_text(size=12,face="bold"),
  #       plot.title = element_text(colour = "grey39"),
  #       #panel.grid.major = element_blank(),
  #       panel.grid.major = element_line(colour = "grey86",size=0.5), ### these remove the minor lines
  #       panel.grid.minor = element_line(colour = "grey86",size=0.5))+
  facet_grid(v.eff~risk_f,scales="free")

ggsave('figure4.png', height = 5, width = 7, dpi=1200)

f5 <- ggplot(subset(datfull,scenario %in% "vax70" & reference %in% "vaxbase"), aes(y=cost.diff.per100k, x=dalys.averted.per100k, group=age, colour=age))+
  geom_point()+
  expand_limits(y=0) +
  labs(y="Cost saved per 100,000 population\n", x="\nDALYs averted per 100,000 population", color="Age group")+ 
  theme_bw() +
  # theme(axis.text=element_text(size=10),
  #       axis.title=element_text(size=12,face="bold"),
  #       plot.title = element_text(colour = "grey39"),
  #       panel.grid.major = element_blank(),
  #       #panel.grid.major = element_line(colour = "grey86",size=0.5), ### these remove the minor lines
  #       panel.grid.minor = element_blank())+
  facet_grid(v.eff~risk_f,scales="free")

ggsave('figure5.png', height = 6, width = 8, dpi=1200)
