rawdat <- read.csv('in.csv',header=FALSE)

#Load the ismev package
library(ismev)

#Extract the data we need
wind.anmax <- rawdat[,1]
len <- lengths(rawdat)

#Process the data
ti = matrix(ncol=1,nrow=len)
ti[,1] = seq(0,len-1,1)
mle <- gum.fit(wind.anmax,ydat=ti,mul=1)
class(mle) <- append(class(mle),"Flam")
GetFirst <- function(x)
{
	UseMethod("GetFirst",x)
}
GetFirst.Flam <- function(x)
{
	return(x$mle)
}

#Capture and dump to output file
output <- GetFirst(mle)

write.csv(output,'out.csv')
