/* Database schema to keep the structure of entire database. */

CREATE TABLE animal (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY (id),
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
     weight_kg DECIMAL
);

ALTER TABLE animal ADD species VARCHAR(250);

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(250),
  age INT
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(250)
);

ALTER TABLE animal DROP COLUMN species;
ALTER TABLE animal ADD species_id INT;
ALTER TABLE animal ADD FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animal ADD owner_id INT;
ALTER TABLE animal ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

