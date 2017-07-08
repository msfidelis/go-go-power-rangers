
CREATE TABLE season (
    id_season INTEGER PRIMARY KEY,
    title TEXT UNIQUE,
    theme TEXT, 
    year INTEGER
);

CREATE TABLE person (
    id_person INTEGER PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE ranger (
    id_ranger INTEGER PRIMARY KEY,
    name TEXT,
    color TEXT,
    planet TEXT,
    specie TEXT,
    id_season INTEGER,
    FOREIGN KEY(id_season) REFERENCES season(id_season) 
);

CREATE TABLE person_is_ranger (
    id INTEGER PRIMARY KEY, 
    id_person INTEGER, 
    id_ranger INTEGER,
    FOREIGN KEY(id_person) REFERENCES person(id_person), 
    FOREIGN KEY(id_ranger) REFERENCES ranger(id_ranger)
    
);

CREATE TABLE mentor (
    id_mentor INTEGER PRIMARY KEY, 
    id_person INTEGER,
    id_season INTEGER,
    FOREIGN KEY(id_person) REFERENCES person(id_person), 
    FOREIGN KEY(id_season) REFERENCES season(id_season)   
);

CREATE TABLE person_is_mentor (
    id INTEGER PRIMARY KEY, 
    id_person INTEGER, 
    id_ranger INTEGER,
    FOREIGN KEY(id_person) REFERENCES person(id_person), 
    FOREIGN KEY(id_ranger) REFERENCES ranger(id_ranger)
);

INSERT INTO season (`title`, `theme`, `year`) VALUES ('Power Rangers: Mighty Morphin Power Rangers', 'Dinosaurs', 1995), ('Mighty Morphin Alien Rangers', 'Aliens', 1996), ('Power Rangers: Zeo ', 'Space Crystals', 1996), ('Power Rangers: Turbo ', 'Cars', 1997), ('Power Rangers in Space', 'Space',1998), ('Power Rangers: Lost Galaxy', 'Space', 1999);

INSERT INTO person (`name`) VALUES ('Zordon'), ('Jason'), ('Kimberly'), ('Billy'), ('Zack'), ('Trini'), ('Tommy'), ('Rita Repulsa');

SELECT * FROM season;

