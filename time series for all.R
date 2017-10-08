setwd("C:\\Users\\jayan\\Documents\\Datathon")
library(forecast)
d=read.csv("combined (1).csv")
head(d)

data=matrix(nrow=130,ncol=5)
colnames(data)<-c("county","prescription_rate","establishment","employment","pay")
county=levels(d$County)

for( i in 1:130)
{
  data[i,1]=county[i]
 # mypath <- file.path("C:\\Users\\jayan\\Documents\\Datathon\\Visulaiztion",paste("Prescription Rate for ",county[i],".jpg", sep = ""))
  #jpeg(file=mypath)
model<-ts(d[which(d$County==county[i]),3],start = 2011 ,frequency = 1)
model
a=forecast(model)
#plot(forecast(model), main=paste("Prescription Rate for ",county[i]))
data[i,2]=round(a$mean[2],1)
#dev.off()

#mypath <- file.path("C:\\Users\\jayan\\Documents\\Datathon\\Visulaiztion",paste("Annual average establishment count for ",county[i],".jpg", sep = ""))
 # jpeg(file=mypath)
  
  model<-ts(d[which(d$County==county[i]),4],start = 2011 ,frequency = 1)
  model
  a=forecast(model)
  
 # plot(forecast(model), main=paste("Annual average establishment count for ",county[i]))
  data[i,3]=round(a$mean[2],1)
  #dev.off()

  #  mypath <- file.path("C:\\Users\\jayan\\Documents\\Datathon\\Visulaiztion",paste("Annual average Employment for ",county[i],".jpg", sep = ""))
  #jpeg(file=mypath)
  
  model<-ts(d[which(d$County==county[i]),5],start = 2011 ,frequency = 1)
  model
  a=forecast(model)
  #plot(forecast(model), main=paste("Annual average Employment for ",county[i]))
  data[i,4]=round(a$mean[2],1)
  #dev.off()

 #   mypath <- file.path("C:\\Users\\jayan\\Documents\\Datathon\\Visulaiztion",paste("Annual average Pay for ",county[i],".jpg", sep = ""))
  #jpeg(file=mypath)
  
  model<-ts(d[which(d$County==county[i]),6],start = 2011 ,frequency = 1)
  model
  a=forecast(model)
   #plot(forecast(model), main=paste("Annual average Pay for ",county[i]))
   data[i,5]=round(a$mean[2],1)
#  dev.off()
}

setwd("C:\\Users\\jayan\\Documents\\Datathon\\Visulaiztion")
write.csv(data,"2018_prediction.csv",row.names = FALSE)

