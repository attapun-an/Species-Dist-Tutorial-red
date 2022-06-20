# raster manipulation

# set wd ----
setwd("D:/Github/IngaTutorial")

# load packages ----
library(raster)
library(rgdal)

# import rasters ----
# list the files we want 
Lst_Bio <- list.files("data/bioclim", pattern = ".tif", full.names = TRUE)
Lst_Top <- list.files("data/earthenv", pattern = ".tif", full.names = TRUE)


Rst_Bio <- stack(lapply(Lst_Bio, raster))
Rst_Top <- stack(lapply(Lst_Top, raster))

Rst_Bio
Rst_Top

plot(Rst_Bio[[1]])

# set crop and crs ----
# Cropping
Ext_West <- -100
Ext_East <- -45
Ext_South <- -25
Ext_North <- 25

e <- as(extent(Ext_West, Ext_East, Ext_South, Ext_North), 'SpatialPolygons')
crs(e) <- "+proj=longlat +datum=WGS84 +no_defs" 

Rst_Bio_C <- crop (Rst_Bio, e)

Rst_Top_RE <- projectRaster(Rst_Top, Rst_Bio_C)

Rst_Top_RE
Rst_Bio_C

plot(Rst_Top_RE[[1]])

Rst_Top_RE_M <- mask(Rst_Top_RE, Rst_Bio_C)

# Stacking

Rst_Env <- stack(Rst_Bio_C, dropLayer(Rst_Top_RE_M, 2))
Rst_Env

Rst_Elev <- Rst_Top_RE[[2]]
Rst_Elev

writeRaster(Rst_Env, "data/processed/rst_env.tif")
writeRaster(Rst_Elev, "data/processed/rst_elev.tif")


