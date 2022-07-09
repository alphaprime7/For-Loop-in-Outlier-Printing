### Disclaimer this code is inspired by an old classmate who shared his approach 
# to this problem with me
#getwd()
#list.files()
#install.packages('readxl')
##Create a vector container for outData--For loop for outlier printing.
#Here we force fledglingtarsus == mavData$out
#bc we know that the normal outlier function will likely just take in
#fledgling tarsus data without accounting for bombed vs not bombed
mavData = boxplot(fledgling.tarsus.mm ~ bombed, data=fledg, main ='Boxplot for bombed attribute', xlab='Bombed', ylab ='Fledgling Tarsus', ylim=c(0,22))
mavData = boxplot(fledgling.tarsus.mm ~ bombed, data=fledg, notch = T, main ='Boxplot for bombed attribute', xlab='Fledgling Tarsus', ylab ='Bombed', horizontal = T, ylim=c(5,22))
print(mavData)
outData = c()
for (i in 1:length(mavData[["out"]])){
  outData = c(outData, which(fledg$fledgling.tarsus.mm == mavData$out[i]))
}
print(outData) # Gives us the tuple of the outlier
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

##Another For loop approach
outData = vector()
for (i in 1:length(mavData$out)){
  out1 <- which(fledg$fledgling.tarsus.mm == mavData$out[i])
  outData[i] <- out1
}
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

#testing for loop issues in my R setup. I wasnt sure if i needed devtools or Rtools
#installed.
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

outlier.bp = c()
for (i in range(mavData[["out"]])){
  outlier.bp = c(outlier.bp, print(i))
}
outlier.bp