corr <- function(specdata,threshold=0)
{
  specdata <- "specdata/"
  df=complete(specdata)
  ids=df[df["nobs"]>threshold,]$id
  correlation=numeric()
  for(i in ids)
  {
    newRead=read.csv(paste(specdata,formatC(i,width=3,flag="0"), 
                           ".csv",sep=""))
    snedecor=newRead[complete.cases(newRead), ]
    correlation=c(correlation,cor(snedecor$sulfate,snedecor$nitrate))
  }
  return(correlation)
}

