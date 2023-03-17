-- Database: baza_films

-- DROP DATABASE IF EXISTS baza_films;

-- start 1-----------------------------------
CREATE DATABASE baza_films
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
-- end start 1--------------------------------

-- start 2------------------------------------
 CREATE TABLE films
(
	films_id int PRIMARY KEY,
	title text NOT NULL,
	name_country text NOT NULL, 
	year_released date NOT NULL, 
	slogan text,	
	budget decimal,
	fees_world decimal,	
	world_premiere date NOT NULL,
	age varchar(32) NOT NULL,
	length_ varchar(32) NOT NULL	
	
);

CREATE TABLE genre
(
	genre_id int PRIMARY KEY,
	name_genre varchar(128) NOT NULL,
	fk_films_id int REFERENCES films(films_id) NOT NULL
);

CREATE TABLE person
-- profession: regisseur, scenario, producer, operator, composer, designer, montage, ...
(
	person_id int PRIMARY KEY,
	full_name text NOT NULL,	
	profession text, NOT NULL,
    contacts text,
    fk_films_id int REFERENCES films(films_id) NOT NULL
	
);

CREATE TABLE viewers
(
	viewers_id int PRIMARY KEY,
	contry_name text NOT NULL,
    contry_flag text,
	number_viewers int	NOT NULL,
	fk_films_id int REFERENCES films(films_id) NOT NULL
);

   CREATE TABLE actors
(
	actors_id int PRIMARY KEY,
	full_name text NOT NULL,
	contacts text,
	rating real
	
);

CREATE TABLE understudy
(
	understudy_id int PRIMARY KEY,
	full_name text NOT NULL,
	contacts text,
	rating real
	
);

CREATE TABLE films_actors
(
	films_id int REFERENCES films(films_id),
	actors_id int REFERENCES actors(actors_id),
	
	CONSTRAINT films_actors_pkey PRIMARY KEY (films_id, actors_id) -- composite key
	
);

CREATE TABLE films_understudy
(
	films_id int REFERENCES films(films_id),
	understudy_id int REFERENCES understudy(understudy_id),
	
	CONSTRAINT films_understudy_pkey PRIMARY KEY (films_id, understudy_id) -- composite key
	
);
-- end start 2--------------------------------



