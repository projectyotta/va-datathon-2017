setwd("~/Datathon/Visulaiztion/Cohort Vs dropout rate")
death_rate=read.xlsx("death_rate.xlsx",sheetIndex = 1)
cohort=read.csv("cohort_modified.csv")
county=levels(cohort$County)
colors=c("red","blue")

years=range(2008:2014)
y=range(0:60)
for(i in 1:132)
{
  mypath <- file.path("C:\\Users\\jayan\\Documents\\Datathon\\Visulaiztion",paste(county[i], ".jpg", sep = ""))
  jpeg(file=mypath)
  
plot(years,y,type = "n",main=paste("droup_rate and death_ rate for ",county[i]))

lines(c(2008:2014),cohort[which(cohort$County==county[i]),5],type = "b",col =colors[1],lty=1)
text(c(2008:2014),cohort[which(cohort$County==county[i]),5],round(cohort[which(cohort$County==county[i]),5],1),pos=1)

lines(c(2008:2014),death_rate[which(death_rate$Locality.of.Injury==county[i]),2:8],type="b",col=colors[2],lty=2)
text(c(2008:2014),death_rate[which(death_rate$Locality.of.Injury==county[i]),2:8],round(death_rate[which(death_rate$Locality.of.Injury==county[i]),2:8],1),pos=1)

legend("topleft",c("Dropout","death"),col=colors,lty = c(1,2),cex = 0.6)
dev.off()
}

