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
# We can cluster the intensity values using hierarchical values
clusterIntensity <- hclust(distance, method = "ward") # ward tries to minimize variance between clusters and distance
plot(clusterIntensity)
rect.hclust(clusterIntensity, k = 3, border = "red")
flowerClusters <- cutree(clusterIntensity, k = 3)
flowerClusters
tapply(flowerVector, flowerClusters, mean)
dim(flowerClusters) <- c(50,50) # 50x50 resolution matrix
image(flowerClusters, axes = F)
image(flowerMatrix, axes = F, col = grey(seq(0,1,length = 256))) # length of 256 for greyscale, plus 0-1 for white to black.
# hierarchical clustering of MRI data
healthy <- read.csv("healthy.csv", header = F)
healthyMatrix <- as.matrix(healthy)
str(healthyMatrix)
image(healthyMatrix, axes = F, col= grey(seq(0,1,length = 256)))
healthyVector <- as.vector(healthyMatrix)
# distance <- dist(healthyVector, method = "euclidean") -----> don't do this! 2GB of data!
str(healthyVector)
n <- 365636
n*(n-1)/2
# let's do k means instead


