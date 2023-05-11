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