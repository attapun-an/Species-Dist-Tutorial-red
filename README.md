## SDM using red for R
coded by attapun-an (attapunanivat@gmail.com)

#### Description
Species distribution modelling predicts where a species is likely to occur from occurrence data (where the species was observed) and spatial/environmental data. 
This was an attempt to show what I did during my dissertation without sharing the repository which contains too much suicidal ideation in the commit messages, it was supposed to be accompanied by videos which have since been taken down because I only know how to get the model working, not it's assumption or nuances. 

![species distribution model](/images/SDM.jpg)
<img src="/images/occurrence.jpg" alt="occurrence data" width="49%"/>
<img src="/images/env.jpg" alt="spatial data" width="50%"/>

species distribution model (top), occurrence data (bottom left), spatial data (bottom right)

#### Useful Links
- Red documentation https://cran.r-project.org/web/packages/red/red.pdf
- Tutorial on red https://bdj.pensoft.net/article_preview.php?id=20530&skip_redirect=1
- More on ESMs https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.12403

#### Data source
Amatulli, G., Domisch, S., Tuanmu, MN. et al. A suite of global, cross-scale topographic variables for environmental and biodiversity modeling. Sci Data 5, 180040 (2018). https://doi.org/10.1038/sdata.2018.40

Fick, S.E. and R.J. Hijmans, 2017. WorldClim 2: new 1km spatial resolution climate surfaces for global land areas. International Journal of Climatology 37 (12): 4302-4315. https://www.worldclim.org/data/worldclim21.html

GBIF.org (19 June 2019) GBIF Occurrence Download  https://doi.org/10.15468/dl.qdqpul


#### Packages and versions
`raster` `red + dependencies` `rJava` `rgdal` `dplry` `tidyr`
Coded on r 4.1.2
