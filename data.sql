/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '02-03-2020', 0, True, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '11-15-2019', 2, True, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '01-07-2021', 1, False, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '05-12-2017', 5, True, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '02-08-2020', 0, False, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '11-15-2021', 2, True, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '04-02-1993', 3, False, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '06-12-2005', 1, True, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '06-07-2005', 7, True, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '10-13-1998', 3, True, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '05-14-2022', 4, True, 22);

/*Populate Data in Owners Table*/
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

/*Populate Data in Species Table*/
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

/*Update Data in animals Table*/
UPDATE animals SET species_id = (SELECT id FROM species WHERE name= 'Digimon') WHERE name LIKE '%mon%';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name= 'Pokemon') WHERE species_id IS NULL;
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE name = 'Sam Smith') WHERE name ='Agumon';
UPDATE animals SET owners_id = 2 WHERE name = 'Gabumon';
UPDATE animals SET owners_id = 2 WHERE name = 'Pikachu';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');