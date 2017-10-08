library(gridExtra)

setwd("~/Datathon/cleaned final/state drug utilization data")
data=read.csv("percocet_data.csv")
colnames(data)
year_qrt=paste(data[,14],data[,9],sep = "-")
#year_qrt=as.numeric(year_qrt)
data$year_qrt=year_qrt
drug=levels(data$Product.Name)

range(data$Number.of.Prescriptions)
range(data$Units.Reimbursed)
i=1
par(mfrow=c(2,1))

for(i in 1:199)
{
  par(mfrow=c(2,1))
data_sample=data[which(data$Product.Name==drug[i]),]
mypath <- file.path("C:\\Users\\jayan\\Documents\\Datathon\\Visulaiztion",paste(gsub("/", "", drug[i]),".jpg", sep = ""))
jpeg(file=mypath)
a=ggplot(data_sample,aes(x=year_qrt,y=Units.Reimbursed))+ggtitle(paste("Units reimbursed for ",drug[i]))+
  stat_summary(aes(y = Units.Reimbursed,group = 1), fun.y=mean, colour="red", geom="line")

b=ggplot(data_sample,aes(x=year_qrt,y=Number.of.Prescriptions))+stat_summary(aes(y = Number.of.Prescriptions,group = 1), fun.y=mean, colour="blue", geom="line")+ggtitle(paste("No.of Prescriptions for ",drug[i]))
grid.arrange(a,b,nrow=2)
dev.off()
}


##########################################################
ggplot(data_sample,aes(x=year_qrt,y=Number.of.Prescriptions))+geom_point()


ggplot(data,aes(x=unique(year_qrt),y=data[which(data$Product.Name==drug[i]),5]))

plot(range(data$year_qrt),c(6.9,3096000),type = "n",main=paste("No.of Prescriptions vs units reimbursed ",drug[i]))

lines(data$year_qrt,data[which(data$Product.Name==drug[i]),5],type = "b",col =colors[1],lty=1)
text(data$year_qrt,data[which(data$Product.Name==drug[i]),5],round(data[which(data$Product.Name==drug[i]),5],1),pos=1)

lines(data$year_qrt,data[which(data$Product.Name==drug[i]),12],type="b",col=colors[2],lty=2)
text(data$year_qrt,data[which(data$Product.Name==drug[i]),12],round(data[which(data$Product.Name==drug[i]),12],1),pos=1)

legend("topleft",c("Dropout","death"),col=colors,lty = c(1,2),cex = 0.6)
