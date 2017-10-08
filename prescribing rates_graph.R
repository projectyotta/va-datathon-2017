setwd("~/Datathon/Visulaiztion/Prescribing")
data <- read.xlsx("prescribing rates.xlsx",sheetName = 1)

head(data)
colors=rainbow(115)


for (i in 1:115)
{
mypath <- file.path("C:\\Users\\jayan\\Documents\\Datathon\\Visulaiztion",paste(data[i,1], ".jpg", sep = ""))
jpeg(file=mypath)
plot(c(2006:2016),as.numeric(data[i,2:12]),type='l', main= paste("Prescribing rates for ",data[i,1]))
text(c(2006:2016),as.numeric(data[i,2:12]),as.numeric(data[i,2:12]),pos=1)
dev.off()
}




