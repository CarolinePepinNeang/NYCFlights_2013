SET AUTOCOMMIT = 0;
START TRANSACTION ;

-- Conncetion à la DB.
USE nyc_flights ;

-- ------------------------------------------------------
-- Chargement de la table flights depuis un fichier csv.
-- ------------------------------------------------------
TRUNCATE TABLE flights ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights_csv_MySQL/flights.csv'
INTO TABLE flights
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SHOW WARNINGS ; -- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).

-- ------------------------------------------------------
-- Chargement de la table airlines depuis un fichier csv.
-- ------------------------------------------------------
TRUNCATE TABLE airlines ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights_csv_MySQL/airlines.csv'
INTO TABLE airlines
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	carrier,
    name
);
SHOW WARNINGS ; -- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).

-- ----------------------------------------------------
-- Chargement de la table planes depuis un fichier csv.
-- ----------------------------------------------------
TRUNCATE TABLE planes ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights_csv_MySQL/planes.csv'
INTO TABLE planes
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	tailnum,
    year,
    type,
    manufacturer,
    model,
    engines,
    seats,
    speed,
    engine
);     
SHOW WARNINGS ; -- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).

-- ------------------------------------------------------
-- Chargement de la table airports depuis un fichier csv.
-- ------------------------------------------------------
TRUNCATE TABLE airports ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights_csv_MySQL/airports.csv'
INTO TABLE airports
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	faa,
	name,
	lat,
	lon,
	alt,
	tz,
	dst,
	tzone
);     
SHOW WARNINGS ; -- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).


-- -----------------------------------------------------
-- Chargement de la table weather depuis un fichier csv.
-- -----------------------------------------------------
TRUNCATE TABLE weather ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights_csv_MySQL/weather.csv'
INTO TABLE weather
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	origin,
    year,
    month,
    day,
    hour,
    temp,
    dewp,
    humid,
    wind_dir,
    wind_speed,
    wind_gust,
    precip,
    pressure,
    visib,
    time_hour
);     
SHOW WARNINGS ; -- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).




SET AUTOCOMMIT = 1;