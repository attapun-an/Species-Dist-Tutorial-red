# raster manipulation

# set wd ----
setwd("D:/Github/IngaTutorial")

# load packages ----
library(raster)
library(rgdal)

# set crop and crs ----
# Cropping
Ext_West <- -100
Ext_East <- -45
Ext_South <- -25
Ext_North <- 25

e <- as(extent(Ext_West, Ext_East, Ext_South, Ext_North), 'SpatialPolygons')
crs(e) <- "+proj=longlat +datum=WGS84 +no_defs" 


# import rasters ----
# list the files we want 
Lst_Bio <- list.files("data/bioclim", pattern = ".tif", full.names = TRUE)

# import the files
Rst_Bio <- stack(lapply(Lst_Bio, raster))

Rst_Bio_C <- crop(Rst_Bio, e)

plot(Rst_Bio_C)

# import the topographic data 
Lst_Top <- list.files("data/earthenv", pattern = ".tif", full.names = TRUE)

Rst_Top_C <- crop(stack(lapply(Lst_Top, raster)),e)

Rst_Top_C_RE <- projectRaster(Rst_Top_C, Rst_Bio_C)

Rst_Top_C_RE
Rst_Bio_C
