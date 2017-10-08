setwd("~/Datathon/cleaned final/state drug utilization data")
data=read.csv("percocet_data.csv")
a=levels(data$Product.Name)
for(i in 1:199)
{
n_a=which(data$Product.Name==a[i])
data_a=data[n_a,]
mypath <- file.path("C:\\Users\\jayan\\Documents\\Datathon\\Visulaiztion",paste(gsub("/", "", a[i]), ".jpg", sep = "1"))
jpeg(file=mypath)
plot(data_a$Year,data_a$Package.Size ,xlab = "Year",ylab = "Package sizes", main= paste("Package size for ",a[i]),cex =2,col="blue")
text(data_a$Year,data_a$Package.Size, data_a$Package.Size,pos = 1)
dev.off()
}

