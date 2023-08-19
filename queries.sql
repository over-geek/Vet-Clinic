/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = 'TRUE' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name ='Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'TRUE';
SELECT * FROM animals WHERE NOT name ='Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT species FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals;
SELECT COUNT(*) FROM animals;
ROLLBACK;
SELECT COUNT(*) FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT vet_clinic;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO vet_clinic;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) AS avg_escape_attempts FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) AS min_weight_kg, MAX(weight_kg) AS max_weight_kg FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS avg_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- Question 1: What animals belong to Melody Pond?

-- Show all animals owned by Melody Pond
SELECT animals.name, species.name AS species FROM animals
  JOIN owners ON animals.owner_id = owners.id
  JOIN species ON animals.species_id = species.id
  WHERE owners.full_name = 'Melody Pond';

-- Question 2: List of all animals that are pokemon.

-- Show all 'Pokemon' type animals
SELECT animals.name, species.name AS species FROM animals
  INNER JOIN species ON animals.species_id = species.id
  WHERE species.name = 'Pokemon';

-- Question 3: List all owners and their animals, remember to include those that don't own any animal.

-- Show all animals owners and their animals
SELECT owners.full_name AS owner, animals.name AS animal_name FROM animals
  RIGHT JOIN owners ON animals.owner_id = owners.id
  ORDER BY owners.full_name;

-- Question 4: How many animals are there per species?

-- Show all animals by species
SELECT species.name AS species_name, COUNT(*) AS num_animals FROM animals
  JOIN species ON animals.species_id = species.id
  GROUP BY species.id, species.name
  ORDER BY num_animals DESC;

-- Question 5: List all Digimon owned by Jennifer Orwell.

-- Show all 'Digimon' type animals owned by Jennifer Orwell.
SELECT animals.name AS animal_name, species.name AS species_name, owners.full_name AS animal_owner FROM animals
  INNER JOIN species ON animals.species_id = species.id
  INNER JOIN owners ON animals.owner_id = owners.id
  WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- Question 6: List all animals owned by Dean Winchester that haven't tried to escape.

-- Show all of Dean Winchester animals that have never tried to escape.
SELECT name AS non_esc_animals FROM animals
  INNER JOIN owners ON animals.owner_id = owners.id
  WHERE animals.owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') AND animals.escape_attempts = 0;

-- Question 7: Who owns the most animals?

-- Show who owns the most animals.
SELECT o.full_name AS animal_owner, COUNT(a.name) AS total_animals FROM animals 
  a INNER JOIN owners o ON a.owner_id = o.id 
  GROUP BY o.full_name 
  ORDER BY total_animals DESC LIMIT 1;

-- Queries to answer questions on visti

--Who was the last animal seen by William Tatcher?
SELECT a.animal_name AS last_animal_seen FROM animals a
JOIN visits v ON a.animal_id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?

SELECT COUNT(DISTINCT v.animal_id)
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties

SELECT vt.name, s.name
FROM vets vt
LEFT JOIN specializations sp ON vt.id = sp.vet_id
LEFT JOIN species s ON sp.species_id = s.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020

SELECT a.name FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez' AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT a.name FROM animals a
JOIN visits v ON a.id = v.animal_id
GROUP BY a.name
ORDER BY COUNT(v.vet_id) DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?

SELECT a.name AS animal_name, v.visit_date AS visit_date FROM visits v 
INNER JOIN animals a ON v.animal_id = a.id 
INNER JOIN vets vt ON v.vet_id = vt.id 
WHERE vt.name = 'Maisy Smith' 
ORDER BY v.visit_date ASC 
LIMIT 1;

-- Details for the most recent visit: animal information, vet information and date of visit

SELECT a.id AS animal_id, a.name AS animal_name, a.date_of_birth , vt.name AS vet_name, vt.age AS vet_age, vt.date_of_graduation AS graduation_date, v.visit_date
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
ORDER BY v.visit_date DESC
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) AS total_visits_no_specialization FROM visits v INNER JOIN animals a ON v.animal_id = a.id WHERE v.vet_id NOT IN (SELECT sp.vet_id FROM specializations sp WHERE sp.species_id = a.species_id);

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT (SELECT s.name FROM species s WHERE s.id = a.species_id) AS specialty_name FROM visits v INNER JOIN vets ve ON v.vet_id = ve.id INNER JOIN animals a ON v.animal_id = a.id WHERE ve.name = 'Maisy Smith' GROUP BY specialty_name ORDER BY COUNT(*) DESC LIMIT 1;

-- 