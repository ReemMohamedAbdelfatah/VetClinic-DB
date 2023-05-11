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

ALTER TABLE animals ADD species VARCHAR(250);
