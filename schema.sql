SET AUTOCOMMIT = 0;
START TRANSACTION ;
DROP SCHEMA IF EXISTS nyc_flights ;
CREATE SCHEMA nyc_flights CHARACTER SET utf8mb4  -- Choix de 'utf8mb4' car 'utf8' est un alias pour 'utf8mb3' qui
             DEFAULT COLLATE utf8mb4_0900_ai_ci; -- le sera pour 'utf8mb4' dans les futures versions de MySQL.
                                                   
-- Si MySQL5.x : prise en charge de la compression des tables et indexes.
-- SET GLOBAL innodb_file_per_table = 1;      -- Pour permettre la compression faite par Barracuda.
-- SET GLOBAL innodb_file_format = "Barracuda"; -- Barracuda gère la compression des données.


-- Connection à la DB.
USE nyc_flights;

-- -----------------------------
-- Création de la table Flights
-- -----------------------------
DROP TABLE IF EXISTS Flights;

CREATE TABLE Flights (
     year CHAR(4)
     ,month CHAR(2)
     ,day CHAR(2)
     ,dep_time SMALLINT UNSIGNED
     ,sched_dep_time SMALLINT UNSIGNED
     ,dep_delay SMALLINT # puisqu'il y a du négatif alors pas de UNSIGNED
     ,arr_time SMALLINT UNSIGNED
     ,sched_arr_time SMALLINT UNSIGNED
     ,arr_delay SMALLINT
     ,carrier CHAR(2)
     ,flight VARCHAR(4)
     ,tailnum CHAR(6)                -- Attention ajouter FK à tailnum pour connecter à planes --
     ,origin CHAR(3)
     ,dest CHAR(3)
     ,air_time SMALLINT UNSIGNED
     ,distance SMALLINT UNSIGNED
     ,hour CHAR(2)
     ,minute CHAR(2)
     ,time_hour DATETIME -- year + month + day + hour(sans prendre en compte les minutes)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ; 



## ne pas oublier :

-- flights est connecté à planes par une seule colonne : tailnum ;
-- flights est connecté à airlines par la colonne carrier ;
-- flights est connecté à airports par deux colonnes : origin et dest ;
-- flights est connecté à weather par origin (le lieu), year, month, day et hour (la date).
-- The column airports$faa est la clé étrangère de weather$origin ;

-- -------------------------
-- Création table Airlines
-- -------------------------
DROP TABLE IF EXISTS Airlines;

CREATE TABLE Airlines (
     carrier CHAR(2)
     , name VARCHAR(27) #which.max(nchar(airlines$name))8 et airlines$name[8]"AirTran Airways Corporation" et nchar(airlines$name[8])27
     );

-- -----------------------
-- Création table Planes
-- -----------------------
DROP TABLE IF EXISTS Planes;

CREATE TABLE Planes (
     tailnum VARCHAR(6) #planes$tailnum[1]"N10156" et planes$tailnum[242]"N1602"
     ,year CHAR(4)
     ,type VARCHAR(24) #nchar("Fixed wing single engine") 24
     ,manufacturer VARCHAR(29) #planes$manufacturer[2905]"MCDONNELL DOUGLAS CORPORATION" nchar(planes$manufacturer[2905]) 29
     ,model VARCHAR(18) #planes$model[2932]"MYSTERE FALCON 900" et nchar(planes$model[2932])18
     ,engines CHAR(1)
     ,seats SMALLINT #which.max(nchar(planes$seats))2 et planes$seats[2]182
     ,speed SMALLINT # which.max(nchar(planes$speed))822 et  planes$speed[822]162
     ,engine VARCHAR(13) #which.max(nchar(planes$engine)) 425 et planes$engine[822] "Reciprocating" et nchar(planes$engine[822])13
     );

# apply(is.na(planes),2,sum) pour savoir où il y a des NA et dans quelle colonne. NB 2 pour colonne et 1 pour ligne


-- --------------------------
-- Création table Airports
-- --------------------------
DROP TABLE IF EXISTS Airports;

CREATE TABLE Airports (
     faa VARCHAR(3)
     ,name VARCHAR(51) # airports$name[620] "Huntsville International Airport-Carl T Jones Field"
     ,lat DECIMAL(16,13) #as.character(airports$lat[17])"54.0133333333333"
     ,lon DECIMAL(17,12) #as.character(airports$lon[17])"-124.768333333333"
     ,alt SMALLINT #as.character(airports$alt[1])"1044"
     ,tz TINYINT # as.character(airports$tz[208])"-10"
     ,dst VARCHAR(1) # ou ENUM("A", "U", "N")
     ,tzone VARCHAR(19) #airports$tzone[10]"America/Los_Angeles"
);

-- ------------------------
-- Création table Weather 
-- ------------------------
DROP TABLE IF EXISTS Weather;

CREATE TABLE Weather (
     origin VARCHAR(3)
     ,year CHAR(4)
     ,month CHAR(2) 
     ,day CHAR(2)
     ,hour CHAR(2)
     ,temp DECIMAL(6,2) #weather$temp[4760] 100.04
     ,dewp DECIMAL(5,2) #as.character(weather$dewp[1])"26.06"
     ,humid DECIMAL(5,2) #as.character(weather$humid[1])"59.37"
     ,wind_dir TINYINT #as.character(weather$wind_dir[1])"270"
     ,wind_speed DECIMAL(10,5) # as.character(weather$wind_speed[1010])"1048.36058"
     ,wind_gust DECIMAL(8,5) #as.character(weather$wind_gust[15])"20.71404"
     ,precip DECIMAL(4,2) #as.character(weather$precip[256])"0.05"
     ,pressure DECIMAL(6,1) #as.character(weather$pressure[2])"1012.3"
     ,visib DECIMAL(4,2) #as.character(weather$visib[287])"0.25"
     ,time_hour DATETIME #weather$time_hour <- as.character(weather$time_hour) POUR TRANSFORMER EN CARACTERE SUR R
);
