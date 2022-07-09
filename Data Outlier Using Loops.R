### Disclaimer this code is inspired by an old classmate who shared his approach 
# to this problem with me
#getwd()
#list.files()
#install.packages('readxl')

# utilization of some ifelse to subset my bombed data.  mav=mavericks
library(readxl)
fledg <- read_excel('DataExploDOD.xlsx')
fledg$bomb = ifelse(fledg$bombed == 'Yes', 1, 0)
fledg$bomb1 = ifelse(fledg$bombed == 'Yes', 'Bombed', 'Not Bombed')
png(file = "boxplot_with_notch.png")
mavData = boxplot(fledgling.tarsus.mm ~ bomb, data=fledg, notch = T, varwidth = T, col = c('red', 'green'), boxwex=0.3, ylim=c(0,22))
mavData = boxplot(fledgling.tarsus.mm ~ bombed, data=fledg, main ='Boxplot for bombed attribute', xlab='Bombed', ylab ='Fledgling Tarsus', ylim=c(0,22))
mavData = boxplot(fledgling.tarsus.mm ~ bombed, data=fledg, notch = T, main ='Boxplot for bombed attribute', xlab='Fledgling Tarsus', ylab ='Bombed', horizontal = T, ylim=c(5,22))
print(mavData)

# Right side = 4; Left side = 2 and bottom side = 1, line = -x (into image)
# line = +x (outward image) and cex = size of text
#Using the $out to find our outliers
mavData$out
NCOL(mavData$out)
NROW(mavData$out)
length(mavData$out)
##Create a vector container for outData--For loop for outlier printing.
#Here we force fledglingtarsus == mavData$out
#bc we know that the normal outlier function will likely just take in
#fledgling tarsus data without accounting for bombed vs not bombed
outData = c()
for (i in 1:length(mavData[["out"]])){
  outData = c(outData, which(fledg$fledgling.tarsus.mm == mavData$out[i]))
}
print(outData) # Gives us the tuple of the outlier

for (i in mavData[["out"]]){
  print(i) # print outliers using a forloop
  outlier.bp = c()
}

for (i in mavData[["out"]]){
  outlier.bp = c(outlier.bp, print(i)) #using for loops for outlier printing
}
print(outlier.bp)
z <- as.data.frame(outlier.bp)
NROW(outlier.bp)
NCOL(outlier.bp)

# Here use the order function to order the attribute to see the 
# behavior of the attribute
y = fledg[order(fledg$fledgling.tarsus.mm)]
print(y)
dotchart(y)

outData = c()
for (i in 1:length(mavData$out)){
  outData = c(outData, which(fledg$fledgling.tarsus.mm == mavData$out[i]))
}
outData
print(i)
#rm(out1)
rm(i)
rm(x)
rm(y)
rm(z)
rm(outData)
#rm(out.ind)
##Another For loop approach
outData = vector()
for (i in 1:length(mavData$out)){
  out1 <- which(fledg$fledgling.tarsus.mm == mavData$out[i])
  outData[i] <- out1
}
outData
#testing for loop issues in my R setup
for (x in range(1,5)){
  print(x)
}
#OR 
for (y in 1:4){
  print(y)
}

outlier.bp = c()
for (i in mavData[["out"]]){
  outlier.bp = c(outlier.bp, print(i))
}
outlier.bp
NROW(outlier.bp)

#Using R tools
#if(!require('installr')) {
  #install.packages('installr')
  #library('installr')
#}
#install.Rtools()

# A simple approach to outliers
mavData1 = boxplot.stats(fledg$fledgling.tarsus.mm)$out
#Find the tuples to which the outliers belong
out.ind <- which (fledg$fledgling.tarsus.mm %in% c(mavData1))
print(out.ind)
#Go to tuples in dataset directly
fledg[out.ind, ]