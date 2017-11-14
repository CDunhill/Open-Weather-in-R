
library (owmr)
library (dplyr)

# first of all you have to set up your api key
owmr_settings("cec40b8b84a1daa25593eecad1b96764")

# get current weather data for "London" with temperatures in °C
get_current("London", units = "metric")


# get 3h forcast data (7 rows)
get_forecast("London", cnt = 7)


# Get weather data from a number of stations around given geo point.
find_stations_by_geo_point(52.8, -3.0, cnt = 2)

# British stations only
gbcities <- filter (owm_cities, countryCode == "GB")

# How to write a CSV file (used to check the spread of weather stations using Spotfire)
write.csv(gbcities,"owm_gb_cities.csv", row.names=FALSE)

# Remove prefices from column names.
# EXAMPLE (I'm not yet sure why this would be useful)
x <- data.frame(main.temp = 1:10, sys.msg = "OK", cnt = 10:1)
names(x)
remove_prefix(x, c("main", "sys")) %>% names()

# USEFUL FOR SEARCHING FOR CITIES
search_city_list("Lon", "GB") # up to two search terms
search_city_list("London")
search_city_list("Lon")
