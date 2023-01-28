/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY, 
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    species_id INT FOREIGN KEY REFERENCES species(id),
    owner_id INT FOREIGN KEY REFERENCES owners(id)
);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY, 
    full_name varchar(100),
    age INT
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY, 
    name varchar(100)
);

ALTER TABLE animals ADD COLUMN species_ID INT;
ALTER TABLE animals ADD FOREIGN KEY (species_ID) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_ID INT;
ALTER TABLE animals ADD FOREIGN KEY (owners_ID) REFERENCES owners(id);
