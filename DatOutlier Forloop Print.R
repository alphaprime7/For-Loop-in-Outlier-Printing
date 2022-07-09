## utilization of some ifelse to subset my bombed data.  mav=mavericks
library(readxl)
fledg <- read_excel('DataExploDOD.xlsx')
fledg$bomb = ifelse(fledg$bombed == 'Yes', 1, 0)
fledg$bomb1 = ifelse(fledg$bombed == 'Yes', 'Bombed', 'Not Bombed')
png(file = "boxplot_with_notch.png")
mavData = boxplot(fledgling.tarsus.mm ~ bomb, data=fledg, notch = T, 
                 varwidth = T, col = c('red', 'green'), 
                 boxwex=0.3, ylim=c(0,22))

# Right side = 4; Left side = 2 and bottom side = 1, line = -x (into image)
# line = +x (outward image) and cex = size of text
#Using the $out to find our outliers
mavData$out
NCOL(mavData$out)
NROW(mavData$out)
length(mavData$out)


#Outlier For Loop Stepwise approach
outlier.bp = c()
for (i in mavData[["out"]]){
  print(i) # print outliers using a forloop
  
}

outlier.bp = c()
for (i in mavData[["out"]]){
  outlier.bp = c(outlier.bp, print(i)) #using for loops for outlier printing
}
print(outlier.bp)
z <- as.data.frame(outlier.bp)
print(z)
NROW(outlier.bp)
NCOL(outlier.bp)




