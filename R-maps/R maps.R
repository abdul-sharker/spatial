# Install packages if you don't have them
install.packages(c("sf", "ggplot2"))

# Load libraries
library(sf)
library(ggplot2)

# Example: Load some built-in data
nc <- st_read(system.file("shape/nc.shp", package = "sf"))

# Plot
ggplot(data = nc) +
  geom_sf() +
  theme_minimal()






bd<-st_read("C:/Users/hp/Desktop/Python/Projects/Python maps/bgd_adm_bbs_20201113_shp/bgd_adm_bbs_20201113_SHP/bgd_admbnda_adm0_bbs_20201113.shp")

ggplot(data=bd)+
  geom_sf(fill="lightblue", color="black") +
  ggtitle("Bangladesh")
  

bd

install.packages("ggspatial")
library(ggspatial)

ggplot(data=bd)+
  geom_sf(fill="lightgreen", color="black")+
  annotation_scale(location="bl", width_hint= 0.4)+
  annotation_north_arrow(location="tr",which_north = "true",
                         pad_x = unit(0.2,"in"), pad_y= unit(0.2,"in"),
                         style = north_arrow_fancy_orienteering())+
  theme_minimal()+
  ggtitle("Bangladesh")









BD<-st_read("C:/Users/hp/Desktop/Python/Projects/Python maps/bgd_adm_bbs_20201113_shp/bgd_adm_bbs_20201113_SHP/bgd_admbndp_admALL_bbs_itos_20201113.shp")

ggplot(data=BD)+
  geom_sf(fill="lightgreen", color="black")+
  scale_fill_viridis_d(name = "ALL")+
  annotation_scale(location="bl", width_hint= 0.4)+
  annotation_north_arrow(location="tr",which_north = "true",
                         pad_x = unit(0.2,"in"), pad_y= unit(0.2,"in"),
                         style = north_arrow_fancy_orienteering())+
  theme_minimal()+
  ggtitle("Bangladesh")




DH<-st_read("C:/Users/hp/Desktop/Python/Projects/Python maps/bgd_adm_bbs_20201113_shp/bgd_adm_bbs_20201113_SHP/bgd_admbnda_adm1_bbs_20201113.shp")


DH<-DH[DH$ADM1_EN=="Dhaka",]
DH

ggplot(data=DH)+
  geom_sf(fill="#f7786b", color="black")+
  scale_fill_viridis_d(name = "ALL")+
  annotation_scale(location="br", width_hint= 0.4)+
  annotation_north_arrow(location="tl",which_north = "true",
                         pad_x = unit(0.2,"in"), pad_y= unit(0.2,"in"),
                         style = north_arrow_fancy_orienteering())+
  theme_minimal()+
  ggtitle("Dhaka")




MUN<-st_read("C:/Users/hp/Desktop/Python/Projects/Python maps/bgd_adm_bbs_20201113_shp/bgd_adm_bbs_20201113_SHP/bgd_admbnda_adm2_bbs_20201113.shp")

print(MUN)
MUN<-MUN[MUN$ADM2_EN=="Munshiganj",]
MUN

ggplot(data=MUN)+
  geom_sf(fill="#92a8d1", color="black")+
  scale_fill_viridis_d(name = "ALL")+
  annotation_scale(location="bl", width_hint= 0.4)+
  annotation_north_arrow(location="tr",which_north = "true",
                         pad_x = unit(0.0,"in"), pad_y= unit(0.0,"in"),
                         style = north_arrow_fancy_orienteering())+
  theme_minimal()+
  ggtitle("Munshiganj")


Gaz<-st_read("C:/Users/hp/Desktop/Python/Projects/Python maps/bgd_adm_bbs_20201113_shp/bgd_adm_bbs_20201113_SHP/bgd_admbnda_adm3_bbs_20201113.shp")

Gaz<-Gaz[Gaz$ADM3_EN=="Gazaria",]

ggplot(data=Gaz)+
  geom_sf(fill="#f7cac9", color="black")+
  scale_fill_viridis_d(name = "ALL")+
  annotation_scale(location="tl", width_hint= 0.4)+
  annotation_north_arrow(location="tr",which_north = "true",
                         pad_x = unit(0.0,"in"), pad_y= unit(0.0,"in"),
                         style = north_arrow_fancy_orienteering())+
  theme_minimal()+
  ggtitle("Gazaria")




BHR<-st_read("C:/Users/hp/Desktop/Python/Projects/Python maps/bgd_adm_bbs_20201113_shp/bgd_adm_bbs_20201113_SHP/bgd_admbnda_adm4_bbs_20201113.shp")

BHR<-BHR[BHR$ADM4_EN=="Bhaber Char",]

ggplot(data=BHR)+
  geom_sf(fill="#034f84", color="black")+
  annotation_scale(location="br", width_hint= 0.4)+
  annotation_north_arrow(location="tr",which_north = "true",
                         pad_x = unit(0.0,"in"), pad_y= unit(0.0,"in"),
                         style = north_arrow_fancy_orienteering())+
  theme_minimal()+
  ggtitle("Bhaberchar")



DH$region<-"Dhaka"
MUN$region<-"Munshigonj"
Gaz$region<-"Gazaria"
BHR$region<-"Bhaberchar"
library(dplyr)

# Keep only 'region' and 'geometry' columns
DH_clean  <- DH  %>% select(region, geometry)
MUN_clean <- MUN %>% select(region, geometry)
Gaz_clean <- Gaz %>% select(region, geometry)
BHR_clean <- BHR %>% select(region, geometry)

# Now you can bind them
all_regions <- rbind(DH_clean, MUN_clean, Gaz_clean, BHR_clean)




library (ggspatial)

ggplot()+
  geom_sf(data=all_regions, aes(fill=region), color="black")+
  scale_fill_manual(values=c(
    "Dhaka" = "#f7786b",
    "Munshigonj" = "#92a8d1",
    "Gazaria" = "#f7cac9",
    "Bhaberchar" = "#034f84"
    
  ))+
  annotation_scale(location="br", width_hint= 0.4)+
  annotation_north_arrow(location="tl",which_north = "true",
                         pad_x = unit(0.0,"in"), pad_y= unit(0.0,"in"),
                         style = north_arrow_fancy_orienteering())+
  theme_minimal()+
  ggtitle("Map with targeted District/Sub-district/Union")

Full_map<-ggplot()+
  geom_sf(data=all_regions, aes(fill=region), color="black")+
  scale_fill_manual(values=c(
    "Dhaka" = "#f7786b",
    "Munshigonj" = "#92a8d1",
    "Gazaria" = "#f7cac9",
    "Bhaberchar" = "#034f84"
    
  ))+
  annotation_scale(location="br", width_hint= 0.4)+
  annotation_north_arrow(location="tl",which_north = "true",
                         pad_x = unit(0.0,"in"), pad_y= unit(0.0,"in"),
                         style = north_arrow_fancy_orienteering())+
  theme_minimal()+
  ggtitle("Map of Dhaka with targeted District/Sub-district/Union")

names(DH)
names(MUN)
names(Gaz)
names(BHR)

Full_map
ggsave("Full map.tiff", Full_map,width = 10, height = 8, dpi = 300, units = "in", device = "tiff")