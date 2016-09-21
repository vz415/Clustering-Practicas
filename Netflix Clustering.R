# Data is txt on a webpage. lol, don't use internet explorer, typical.
# Select all data on page then using copy and paste into text edit.

movies <- read.table("movieLens.txt", header = F, sep = "|", quote = "\"")
str(movies)
colnames(movies) <- c("ID", "Title", "ReleaseDate", "VideoReleaseDate", "IMDB", "Uknown", "Action", "Adventure", "Animation", "Childrens", "Comedy", "Crime", "Documentary", "Drama", "Fantasy", "FilmNoir", "Horror", "Musical", "Mystery", "Romance", "SciFi", "Thriller", "War", "Western")

str(movies)
movies$ID <- NULL
movies$ReleaseDate <- NULL
movies$VideoReleaseDate <- NULL
movies$IMDB <- NULL
movies <- unique(movies)

# Compute the distances between the movies
distances <- dist(movies[2:20], method = "euclidean")
clusterMovies <- hclust(distances, method = "ward")
plot(clusterMovies)
# label groups of the cluster with cutree
clusterGroups <- cutree(clusterMovies, k = 10)
# Which clusters are associated with which genre of movies (probs/percentages)
# Action
tapply(movies$Action, clusterGroups, mean)
# Romance
tapply(movies$Romance, clusterGroups, mean)
# Can automate this and export it to a spreadsheet to get a feel for all the movies and their associations with clusters
# This creates combos that repeatedly appear.
# Where MIB, doe?!?!
subset(movies, Title == "Men in Black (1997)")
# Row 257, but which cluster is it in?
clusterGroups[257]
cluster2 <- subset(movies, clusterGroups == 2)
cluster2$Title[1:10] # Movies similar to MIB, sorta. Bad boys is in there!!!


