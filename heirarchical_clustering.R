library(tidyverse)
library(gghighlight)
library(lsa)
library(stylo)
setwd('C:/Users/vatss/codes/furnace-maintenance-predictor')
df = read_csv('data/clustering_data.csv')
rownames(df) <- df$timestamp
df$timestamp <- NULL
df = scale(df)
str(df)
temp = t(df)
str(temp)

cosine_dist = dist.cosine(m)
fit <- hclust(cosine_dist, method="ward.D")
par(mar=c(1,1,1,1))
plot(fit, family="Arial")

# Using dynamic time wrap for distance measure between time series
#install.packages("dtwclust")
library(dtwclust)
res = tsclust(temp[,1:2000], type = "h", k = 3L, distance = "dtw")
plot(res,main="Hierarchical Clustering using DTW",xlab="Columns",ylab="Distance")
