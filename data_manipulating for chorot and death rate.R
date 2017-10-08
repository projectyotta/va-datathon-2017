a=read.xlsx(file="cohort.xlsx", sheetIndex = 1)

county=levels(a$DIV_NAME)

data1=matrix(nrow=924,ncol=5)


colnames(data1)=c("Year","County","Cohort_Cnt","Diploma_Rate","Dropout_Rate")

year=c(2008:2014)
r=1
for(j in 1:132)
for( i in 1:7)
{
  
  data_sample=a[which(a$DIV_NAME==county[j] & a$SCHOOL_YEAR==year[i]),]
  data1[r,1]=year[i]
  data1[r,2]=paste(county[j])
  data1[r,3]=sum(data_sample$COHORT_CNT)
  data1[r,4]=mean(data_sample$DIPLOMA_RATE)
  data1[r,5]=mean(data_sample$DROPOUT_RATE)
  r=r+1
}

write.csv(data1,"cohort_modified.csv")

