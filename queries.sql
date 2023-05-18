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
SELECT species FROM animal;
ROLLBACK;
SELECT species FROM animal;

BEGIN;
UPDATE animal SET species ='digimon' WHERE name LIKE '%mon';
UPDATE animal SET species = 'pokemon' WHERE species IS NULL;
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

SELECT name FROM animal JOIN owners ON owners.full_name = 'Melody Pond' AND owners.id = animal.owner_id;
SELECT animal.name FROM animal JOIN species ON species.name = 'Pokemon' AND animal.species_id = species.id;
SELECT owners.full_name, animal.name FROM owners LEFT JOIN animal ON owners.id=animal.owner_id ORDER BY full_name;
SELECT species.name, COUNT(animal.name) FROM animal JOIN species ON animal.species_id = species.id GROUP BY species.id;
SELECT animal.name FROM animal JOIN owners ON animal.owner_id = owners.id JOIN species ON animal.species_id = species.id
  WHERE species.name='Digimon' AND owners.full_name='Jennifer Orwell' ORDER BY animal.name;
SELECT animal.name FROM animal JOIN owners ON animal.owner_id = owners.id
  WHERE owners.full_name='Dean Winchester' AND escape_attempts=0;
SELECT owners.full_name, COUNT(animal.name) FROM animal JOIN owners ON animal.owner_id = owners.id
  GROUP BY owners.full_name ORDER BY COUNT DESC LIMIT 1;



SELECT vets.name, animal.name, date_of_visit FROM visits
  JOIN animal ON animal.id = animals_id JOIN vets ON vets.id = vets_id
  WHERE vets.name = 'William Tatcher'ORDER BY date_of_visit DESC LIMIT 1;

SELECT vets.name, COUNT(animal.name) FROM visits
  JOIN animal ON animal.id = animals_id JOIN vets ON vets.id = vets_id
  WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;

SELECT vets.name, species.name FROM vets
  LEFT JOIN specializations ON vets.id = vets_id LEFT JOIN species ON species.id = species_id
  ORDER BY vets.name;

SELECT vets.name, animal.name, date_of_visit FROM visits
  JOIN animal ON animal.id = animals_id JOIN vets ON vets.id = vets_id
  WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'
  ORDER BY animal.name;

SELECT animal.name, COUNT(animal.name) FROM visits
  JOIN animal ON animal.id = animals_id GROUP BY animal.name
  ORDER BY COUNT(animal.name) DESC LIMIT 1;

SELECT animal.name, date_of_visit FROM visits
  JOIN animal ON animal.id = animals_id JOIN vets ON vets.id = vets_id
  WHERE vets.name = 'Maisy Smith' ORDER BY date_of_visit ASC LIMIT 1;

SELECT * FROM visits
  JOIN animal ON animal.id = animals_id JOIN vets ON vets.id = vets_id
  ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT(*) FROM visits
  JOIN animal ON animal.id = animals_id JOIN vets ON vets.id = vets_id JOIN specializations ON specializations.vets_id = vets.id
  WHERE specializations.species_id != animal.species_id;

SELECT species.name FROM visits
  JOIN animal ON animal.id = animals_id JOIN vets ON vets.id = vets_id JOIN species ON species.id = species_id
  WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(species.name) DESC LIMIT 1;

/* Queries to audit database execution time.*/
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';
