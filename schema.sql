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

 CREATE TABLE vets (
      id INT GENERATED ALWAYS AS IDENTITY, 
      name CHAR(75), age INT, 
      date_of_graduation DATE, 
      PRIMARY KEY(id)
  );
  
CREATE TABLE specializations (
    vets_id INT REFERENCES vets(id) , 
    species_id INT REFERENCES species(id), 
    PRIMARY KEY(species_id, vets_id)
);
   
CREATE TABLE visits (
    animals_id INT REFERENCES animals(id), 
    vets_id INT REFERENCES vets(id),
    date_of_visits DATE, 
    PRIMARY KEY(animals_id, vets_id, date_of_visits)
);
