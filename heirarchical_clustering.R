library(tidyverse)
library(gghighlight)
library(lsa)
library(stylo)
setwd('C:/Users/vatss/codes/furnace-maintenance-predictor')
df = read_csv('data/clustering_data.csv')
rownames(df) <- df$timestamp
df$timestamp <- NULL
str(df)
temp = t(df)
str(temp)

# dist <- dist(temp, method="euclidean")
# fit <- hclust(dist, method="ward.D")   
# 
# plot(fit, family="Arial")
# rect.hclust(fit, k=4, border="cadetblue")
# 
# # cosine(temp)
# cos.sim <- function(ix) {
#     A = temp[ix[1],]
#     B = temp[ix[2],]
#     return( sum(A*B)/sqrt(sum(A^2)*sum(B^2)) )
#   }   

n <- nrow(temp) 
cmb <- expand.grid(i=1:n, j=1:n) 
C <- matrix(apply(cmb,1,cos.sim),n,n)

cosine_dist = dist.cosine(temp)
fit <- hclust(cosine_dist, method="ward.D")
plot(fit, family="Arial")
