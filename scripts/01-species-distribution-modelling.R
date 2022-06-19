# 01-Species Dist Modelling using red by attapun-an

# set wd ----
setwd("D:/Github/IngaTutorial")

# load packages (part 1) ----
library(dplyr)
library(tidyr)
library(ggplot2)
library(rworldmap)

# load and explore data ----
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
  ungroup()

Data_Inga_sample <- Data_Inga %>% 
  filter(species %in% c("Inga acrocephala", "Inga chocoensis", "Inga venusta"))



# test plot ----
# import world map
world <- getMap(resolution = "low")


(Plt_Pre <- ggplot()+
  geom_point(data = Data_Inga_sample,
             aes(x = Longitude,
                 y = Latitude,
                 colour = species))+
  geom_polygon(data = world, 
               aes(x = long, y = lat, group = group),
               fill = NA, colour = "black")+
  coord_quickmap()+  # Prevents stretching when resizing
  theme_bw()+
  xlim(-100, -45)+
  ylim(-25, 25)
)

# PART TWO: SDM ----


