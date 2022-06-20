# 01-Species Dist Modelling using red by attapun-an

# set wd ----
# replace this with the link to your folder here
setwd("D:/Github/IngaTutorial")

# load packages ----
library(red)
library(rJava)
library(raster)
library(dplyr)
library(tidyr)

# Import data ----

# load data from data folder
Data_Inga_raw <- read.delim("data/0031652-190415153152247.csv")

# explore data
str(Data_Inga_raw)
unique(Data_Inga_raw$species)

# clean data ----
Data_Inga <- Data_Inga_raw %>% 
  select(species, Longitude = decimalLongitude,
         Latitude = decimalLatitude, genus) %>% 
  filter(genus == "Inga") %>% 
  group_by(species) %>% 
  drop_na() %>%
  filter(n()>15) %>%
  ungroup() %>% 
  select(-c(genus))

Data_Inga_sample <- Data_Inga %>% 
  filter(species %in% c("Inga acrocephala", "Inga chocoensis", "Inga venusta"))

Data_Inga_sample <- as.data.frame(Data_Inga_sample)

Data_Inga_SS <- Data_Inga_sample %>% 
  group_by(species) %>% 
  summarise(count = n())

Data_Inga_SS

# import rasters ----

Rst_Env <- stack("data/processed/rst_env.tif")
Rst_Elev <- raster("data/processed/rst_elev.tif")

plot(Rst_Env)
Rst_Env


# SDM ----
red::map.easy(longlat = Data_Inga_sample, layers = Rst_Env,
              move = TRUE, dem = Rst_Elev, mapoption = "sdm",
              runs = 0)

Inga_a <- raster("outputs/SDM/Inga acrocephala.asc")
plot(Inga_a)

# ESM ----
red::map.easy(longlat = Data_Inga_sample, layers = Rst_Env,
              move = FALSE, dem = Rst_Elev, mapoption = "sdm",
              runs = 5, subset = 2)

Inga_a <- raster("outputs/ESM/Inga acrocephala.asc")
plot(Inga_a)