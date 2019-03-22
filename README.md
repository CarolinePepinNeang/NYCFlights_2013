# nycflights13

![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

R For Data Science

A l'origine ce package provient de Rstudio.

Ce package contient des informations sur tous les vols au départ de NYC (Il existe 3 aéroports à New York City : EWR, JFK et LGA).
En 2013, 336 776 vols au total ont décollé depuis New York City. 
Pour aider à comprendre ce qui cause des retards, ce package fournit les tables de données suivantes:

- `flights`: tous les vols au départ de New-York (NYC) en 2013
- `weather`: données météorologiques pour chaque aéroport
- `planes`:  informations de construction de chaque avion
- `airports`: noms et emplacements des aéroports
- `airlines`: noms et codes IATA des compagnies aériennes (les codes AITA ou IATA des compagnies aériennes sont des codes à deux lettres, attribués par l'Association internationale du transport aérien.

## Packages à installer sur Rstudio

- install.packages("tidyverse")
- install.packages("ggplot2")
- library(nycflights13)

## Plan du projet

### Télécharger les rda
        - flights.rda
        - airlines.rda
        - airports.rda
        - planes.rda
        - weather.rda
        
### Convertir les fichiers au format csv

- write_csv(flights, "flights.csv")

- write_csv(airports, "airports.csv")

- write_csv(airlines,"airlines.csv")

- write_csv(planes,"planes.csv")

- write_csv(weather, "weather.csv")


### Création de la BD SQL
- schema_without_constraints
- data

### Problématiques rencontrées sur les CSV
- doublons
- NA
- données incohérentes (ce qui posent des problèmes avec les clés primaires et étrangères)
