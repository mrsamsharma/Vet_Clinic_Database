/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon%';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-12';
SELECT * from animals WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 't';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 OR weight_kg = 10.4 OR weight_kg = 17.3;
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
SAVEPOINT DLT2022A;
UPDATE animals SET weight_kg = animals.weight_kg * -1;
ROLLBACK TO DLT2022A;
UPDATE animals SET weight_kg = animals.weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '01-01-1990' AND '01-01-2000' GROUP BY species;
SELECT name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name= 'Pokemon';
SELECT full_name, name FROM owners LEFT JOIN animals ON owners.id=animals.owners_id;
SELECT COUNT(animals.name) , species.name FROM animals JOIN species ON 
animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals
LEFT JOIN owners ON owners.id = animals.owners_id
LEFT JOIN species ON species.id = animals.species_id
WHERE owners.full_name ='Jennifer Orwell' AND species.name = 'Digimon';
SELECT animals.name FROM animals
LEFT JOIN owners ON owners.id = animals.owners_id
WHERE owners.full_name ='Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name as OWNER , COUNT(animals.name) as count FROM
owners JOIN animals ON owners.id = animals.owners_id GROUP BY owners.full_name
ORDER BY count DESC LIMIT 1;

SELECT vets.name AS vet, animals.name AS animal, 
   visits.date_of_visits AS visited_date 
   FROM visits 
JOIN vets ON vets_id = vets.id 
JOIN animals ON animals_id = animals.id 
WHERE vets_id =
  (SELECT id FROM vets WHERE name = 'William Tatcher') 
ORDER BY date_of_visits DESC LIMIT 1;

/* How many different animals did Stephanie Mendez see? */

SELECT COUNT(DISTINCT animals_id) as no_of_different_animals FROM visits 
JOIN vets ON visits.vets_id=vets.id 
WHERE visits.vets_id=(SELECT id FROM vets WHERE name = 'Stephanie Mendez');

/* List all vets and their specialties, including vets with no specialties. */

SELECT vets.name AS vet, species.name AS specialized_in_species FROM vets 
LEFT JOIN specializations ON vets.id=specializations.vets_id 
LEFT JOIN species ON species_id=species.id;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */

SELECT animals.name as animal_name FROM visits  
JOIN animals ON visits.animals_id = animals.id 
WHERE visits.vets_id= (SELECT id FROM vets WHERE name = 'Stephanie Mendez') 
AND visits.date_of_visits BETWEEN '2020-04-01' AND '2020-08-30';
SELECT animals.name AS most_visited_animals, COUNT(*) AS number_of_visits FROM visits 
JOIN animals ON visits.animals_id=animals.id 
GROUP BY animals.name 
ORDER BY number_of_visits DESC LIMIT 1;
SELECT animals.name as first_visited_animal FROM visits 
JOIN vets ON visits.vets_id=vets.id
JOIN animals ON visits.animals_id = animals.id
WHERE vets.id=(SELECT id FROM vets WHERE name = 'Maisy Smith') 
ORDER BY date_of_visits LIMIT 1;
SELECT animals.name as recently_visited_animal, vets.name as vet, date_of_visits as visited_date FROM visits 
JOIN animals on visits.animals_id = animals.id 
JOIN vets ON visits.vets_id=vets.id 
ORDER BY date_of_visits DESC LIMIT 1;
SELECT COUNT(*) as number_of_nonspecialist_visit from visits 
JOIN animals ON visits.animals_id = animals.id 
JOIN vets ON visits.vets_id=vets.id 
JOIN specializations ON visits.vets_id=specializations.vets_id 
WHERE animals.species_id != specializations.species_id;
SELECT species.name AS MARY_SMITH_should_specialse_on FROM visits 
JOIN vets ON visits.vets_id=vets.id 
JOIN animals ON visits.animals_id=animals.id 
JOIN species ON animals.species_id=species.id 
WHERE visits.vets_id = (SELECT id FROM vets WHERE name = 'Maisy Smith') 
GROUP BY species.name 
ORDER BY COUNT(visits.animals_id) DESC LIMIT 1;
