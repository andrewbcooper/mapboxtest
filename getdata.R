
library(readr)
library(tidygeocoder)

Sys.setenv(MAPBOX_API_KEY = "MAPBOX_API_KEY")

#mapboxdata <- finaldata %>% group_by(city,state,zip,geoPoint.lat,geoPoint.lon) %>% summarize(mycount=n())

#write_rds(mapboxdata[1:10,],"mapboxdata")
silly <- read_rds("mapboxdata")

sillygeo = tryCatch(geo(address = unique(silly$zip),method="mapbox"),error=function(e) {
  Sys.sleep(3)
  geo(address = unique(silly$zip),method="mapbox")
})


write_rds(sillygeo,"mygeo")
