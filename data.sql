/* Populate database with sample data. */

INSERT INTO animal (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Agumon',DATE '2020-02-03',0,true,10.23);

INSERT INTO animal (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Gabumon',DATE '2018-02-15',2,true,8);

INSERT INTO animal (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Pikachu',DATE '2021-01-07',1,false,15.04);

INSERT INTO animal (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Devimon',DATE '2017-05-12',5,true,11);

INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, -11),
       ('Plantmon', '2021-11-15', 2, true, -5.7),
       ('Squirtle', '1993-02-04', 3, false, -12.13),
       ('Angemon', '2005-06-012', 1, true, -45),
       ('Boarmon', '2005-06-07', 7, true, 20.4),
       ('Blossom', '1998-10-13', 3, true, 17),
       ('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'),
       ('Digimon');

UPDATE animal SET species_id = (SELECT id FROM species WHERE name='Digimon' GROUP BY id) WHERE name LIKE '%mon';
UPDATE animal SET species_id = (SELECT id FROM species WHERE name = 'Pokemon' GROUP BY id) WHERE species_id IS NULL;

UPDATE animal SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animal SET owner_id = (SELECT id FROM owners WHERE full_name='Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animal SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animal SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animal SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Boarmon', 'Angemon');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
       ('Maisy Smith', 26, '2019-01-17'),
       ('Stephanie Mendez', 64, '1981-05-04'),
       ('Jack Harkness', 38, '2008-06-08');


INSERT INTO specializations (vets_id, species_id)
VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon')),
       ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon')),
       ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon')),
       ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO visits (vets_id, animals_id, date_of_visit)
VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM animal WHERE name = 'Agumon'), '2020-05-24'),
       ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animal WHERE name = 'Agumon'), '2020-07-22'),
       ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animal WHERE name = 'Gabumon'), '2021-02-02'),
       ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animal WHERE name = 'Pikachu'), '2020-01-05'),
       ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animal WHERE name = 'Pikachu'), '2020-03-08'),
       ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animal WHERE name = 'Pikachu'), '2020-05-14'),
       ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animal WHERE name = 'Devimon'), '2021-05-04'),
       ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animal WHERE name = 'Charmander'), '2021-02-24'),
       ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animal WHERE name = 'Plantmon'), '2019-12-21'),
       ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM animal WHERE name = 'Plantmon'), '2020-08-10'),
       ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animal WHERE name = 'Plantmon'), '2021-04-07'),
       ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animal WHERE name = 'Squirtle'), '2019-09-29'),
       ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animal WHERE name = 'Angemon'), '2020-10-03'),
       ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animal WHERE name = 'Angemon'), '2020-11-04'),
       ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animal WHERE name = 'Boarmon'), '2019-01-24'),
       ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animal WHERE name = 'Boarmon'), '2019-05-15'),
       ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animal WHERE name = 'Boarmon'), '2020-02-27'),
       ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animal WHERE name = 'Boarmon'), '2020-08-03'),
       ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animal WHERE name = 'Blossom'), '2020-05-24'),
       ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM animal WHERE name = 'Blossom'), '2021-01-11');

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animal) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

