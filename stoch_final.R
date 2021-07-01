load("C:/Users/Vaibhav Gupta/Documents/R/timeseries_prac/tsa3.rda")
gold=read.csv(file="gold_price.csv",header = TRUE,sep=',')
silver=read.csv(file="silver_price.csv",header=T,sep=',')
gold[is.na(gold)]<-37.699
df=merge(gold,silver,by.x=c('date'),by.y = c('date'))
names(df)[names(df)=='price.x']<-'gold'
names(df)[names(df)=='price.y']<-'silver'
df$date <- as.Date(df$date)
df$ratio<-with(df,gold/silver)
library(ggplot2)
#ggplot(data = df, aes(x = date, y = gold)) +geom_point()
#ggplot(data = df, aes(x = date, y = silver)) +geom_point()
#ggplot(data = df, aes(x = date, y = ratio)) +geom_point()
goldts=ts(df$gold,start = 1968,end=2021,frequency = 365)
silverts=ts(df$silver,start=1968,end=2021,frequency = 365)
ratiots=ts(df$ratio,start = 1968,end=2021,frequency=365)
#plot(goldts)
#plot(silverts)
#plot(ratiots)

acf2(goldts)
