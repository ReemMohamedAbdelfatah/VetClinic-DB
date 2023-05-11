/*Queries that provide answers to the questions from all projects.*/

SELECT * from animal;

SELECT * FROM animal WHERE name LIKE '%mon';

SELECT name FROM animal WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animal WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animal WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animal WHERE weight_kg > 10.5;

SELECT * FROM animal WHERE neutered = true;

SELECT * FROM animal WHERE name != 'Gabumon';

SELECT * FROM animal WHERE weight_kg >= 10.4 and weight_kg <= 17.4;

BEGIN;
UPDATE animal SET species = 'unspecified';
SELECT * FROM animal;
ROLLBACK;
SELECT * FROM animal;

BEGIN;
UPDATE animal SET species ='digimon' WHERE name LIKE '%mon';
UPDATE animal SET species ='pokemon' WHERE NOT name LIKE '%mon';
COMMIT;
SELECT * FROM animal;

BEGIN;
DELETE FROM animal;
SELECT * FROM animal;
ROLLBACK;
SELECT * FROM animal;

BEGIN;
DELETE FROM animal WHERE date_of_birth > '2022-01-01';
SAVEPOINT first_savepoint;
UPDATE animal SET weight_kg = weight_kg * -1;
SELECT * FROM animal;
ROLLBACK TO SAVEPOINT first_savepoint;
SELECT * FROM animal;
UPDATE animal set weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animal;
COMMIT;
SELECT * FROM animal;

SELECT COUNT(*) FROM animal;
SELECT COUNT(*) FROM animal WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animal;
SELECT neutered, MAX(escape_attempts) FROM animal GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animal GROUP BY species;
SELECT species, AVG(escape_attempts) from animal WHERE date_of_birth BETWEEN '1990-01-01' and '2000-01-01' GROUP BY species;
