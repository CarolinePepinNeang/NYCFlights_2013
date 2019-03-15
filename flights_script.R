#Utiliser le Rprofile

mes_rda <- c("airlines", "airports", "planes", "weather", "flights")

###Transformation fichiers .rda en .csv###

write_csv(airlines, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights_csv_MySQL/airlines.csv")
write_csv(flights, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights_project/airports.csv")
write_csv(flights, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights_csv_MySQL/flights.csv", na="NULL")
write_csv(flights, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights_project/planes.csv")
write_csv(flights, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights_project/weather.csv")


### Autre possibilité : Avec une boucle for###
 

## exemple de boucle for
#for ( i in 1:10) { 
#print(i) 
#}



rep_cible <- "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights_project/"

# ATTENTION il faut mettre paste0 sinon, il y aura des espaces.

for (df in mes_rda) {
	write_csv(get(df), paste0(rep_cible, df, ".csv"), na="NULL")
}



flights$time_hour <- as.character(flights$time_hour)

