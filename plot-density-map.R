#install.packages("ggplot2")
#install.packages("ggmap")

library(ggplot2)
library(ggmap)

# these data is available to download at https://data.police.uk/data
pol01 <- read.csv('C:/Users/Alex/Desktop/2017-01/2017-01-essex-street.csv') # uploading data

# this may give some erros before actually accepting to plot
ggmap(get_map(location='Essex', zoom=9)) + geom_density2d(data = pol01, aes(x=Longitude, y=Latitude, col="darkred")) + ggtitle("Crime Density in Essex in January 2017") + theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank(),legend.position="none") # plot data


