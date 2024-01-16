#heatmaps
#packagages required
install.packages("heatmap3")
install.packages("pheatmap")
library(heatmap3)
library(pheatmap)

heatmap(x, scale = "row")
heatmap(diamonds,scale = "none")
dataframe<-scale(mtcars)
heatmap(dataframe, scale = "row")
heatmap(dataframe, scale = "none")

#creating a small dataframe
nd=diamonds[1:150, depth:z]
heatmap(nd, scale = "row")
heatmap(nd, scale = "none")

library(pheatmap)
pheatmap(diamonds, cutree_rows = 4)
