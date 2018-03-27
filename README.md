# Spatial-Visualization-in-R

Some simple and useful commands to create nice maps.

## Description

It is showing possibilities and processes using Essex crime data, rather a final project about crime (which is likely to become another repository).

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

Plotting using the qmplot() function:
* Libraries and packages
```
install.packages("ggplot2") #if needed
library(ggplot2)
```
* Then one line code is enough.
```
qmplot(data = pol01, Longitude, Latitude)
```

## Authors

Alexandre Marques

## Acknowledgments

* [Analytics Defined](https://analyticsdefined.com/plotting-maps-in-r-using-ggmap/)
