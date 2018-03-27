# Geospatial Visualization with R

Some simple and useful commands to create nice maps.

## Description

It is showing possibilities and processes, using Essex crime data, rather a final project about crime (which is likely to become another repository).

## Getting Started

### Dependencies

* Windows, MacOS or UNIX platforms

### Installing

* R from http://cran.r-project.org
* RStudio from https://www.rstudio.com

### Executing program

Downloading data:
* The data used here was found here: https://data.police.uk/data/ (Jan 17 to Dec 17, Essex Police, include crime data, then Generate file)

Importing data to R(Studio):

```
pol01 <- read.csv('C:/Users/Alex/Desktop/2017-01/2017-01-essex-street.csv') # Crime in Essex in January 2017
```

* Naturally, the name 'pol01' could be anything else, just should be something short and easy to remember. 
* Obviously, this pathway is an example and specific to this file.
* It needs to be repeated for all other 11 files.
* CSV is a compatble file format


**Plotting using the qmplot() function:**
* Libraries and packages

```
install.packages("ggplot2") #if needed
library(ggplot2)
```

* Then, one line code is enough.

```
qmplot(data = pol01, Longitude, Latitude)
```

* 'Longitude' and 'Latitude' are columns from the imported data (so they may have different names for different data) and they are case sensitive (L not equal to l)

![](https://github.com/alexandrenm/Spatial-Visualization-in-R/blob/master/janplot1.png)

* This function automatically centers the points. This ones look off center because there are some outliers. We can had limits.

```
qmplot(data = pol01, Longitude, Latitude, alpha=1/100, shape=".", col="red") +
    xlim(-0.2,1.1) + ylim(51.4,52.1) +
    ggtitle("Crime in Essex in January") + 
    theme(plot.title = element_text(hjust = 0.5))
```

* xlim() and ylim() redefine the chart limits
* alpha() gives transparency to the points
* col="red" gives a red colour to the dots
* ggtitle() adds a title to the charts
* and the last bit adjusts the title to the center

![](https://github.com/alexandrenm/Spatial-Visualization-in-R/blob/master/janplot2.png)

* Points are too large. For some reason, shape="." is not working
* Legend still does not look good as well
* But the worst is we already know where crimes happened, but we still don't know what crimes happened.
* So, we add this bit of code

```
col=factor(Crime.type)
```

* Or this

```
col=pol01$Crime.type
```

* To get this

```
qmplot(data = pol01, Longitude, Latitude, alpha=1/100, col=factor(Crime.type)) +
    xlim(-0.2,1.1) + ylim(51.4,52.1) +
    ggtitle("Crime in Essex in January") +
    theme(plot.title = element_text(hjust = 0.5))
```
![](https://github.com/alexandrenm/Spatial-Visualization-in-R/blob/master/janplot3.png)

* Legend still needs improvement
* Points still large / unclear

(WORK IN PROGRESS)


**Plotting using the ggmap() function:**

* Very similar to what was done before with qmplot() function
* Libraries and packages
```
install.packages("ggplot2") #if needed
install.packages("ggmap") #if needed
library(ggplot2)
library(ggmap)
```

```
ggmap(get_map(location='Essex', zoom=9)) +
    geom_point(data = pol01, aes(x=Longitude, y=Latitude, col=factor(Crime.type), alpha=0.5))
# location can be a continent, a country, a region, a city, a postcode...
```
* ggmap() uses google map
* It may need several go's to find the google map

![](https://github.com/alexandrenm/Spatial-Visualization-in-R/blob/master/janplot4.png)

* Better looking than qmplot(), I think
* Legend still needs improvement
* Points still large / unclear
* Could be bigger
* Alternatively, the geom_density2d() can be a good option

```
ggmap(get_map(location='Essex', zoom=9)) + 
    geom_density2d(data = pol01, aes(x=Longitude, y=Latitude, col="darkred"))
```
![](https://github.com/alexandrenm/Spatial-Visualization-with-R/blob/master/janplot5.png)

* Shows clearly where is less safe to be (inside the red circles)
* We can do this one for each kind of crime
* Aesthetics can be improved

```
densjan17 <- ggmap(get_map(location='Essex', zoom=9)) + geom_density2d(data = pol01, aes(x=Longitude, y=Latitude, col="darkred")) + ggtitle("Crime Density in Essex in January 2017") + theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(),axis.title.y = element_blank(),legend.position="none")
```
```
ggsave("densjan17.png", width = 7, height = 7) # For saving the chart with chosen dimensions
```

* ...

![](https://github.com/alexandrenm/Spatial-Visualization-with-R/blob/master/densjan17.png)

(WORK IN PROGRESS)

## Authors

Alexandre Marques

## Acknowledgments

* [Analytics Defined](https://analyticsdefined.com/plotting-maps-in-r-using-ggmap/)
