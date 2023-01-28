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
