# Clustering image information to get insights. Coo..
# Loading it up.
flower <- read.csv("flower.csv", header = F)
str(flower)
flowerMatrix <- as.matrix(flower)
str(flowerMatrix)
flowerVector <- as.vector(flowerMatrix)
str(flowerVector)
# Calc distances
distance <- dist(flowerVector, method = "euclidean")

