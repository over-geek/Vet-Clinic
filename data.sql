/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Agumon', 'Feb 3, 2020', 10.23, true, 0),
('Gabumon', 'Nov 15, 2018', 8, true, 2),
('Pikachu', 'Jan 7, 2021', 15.04, false, 1),
('Devimon', 'May 12, 2017', 11, true, 5),
('Charmander', '2020-02-08', -11.00, FALSE, 0),
('Plantmon', '2021-11-15', -5.70, TRUE, 2),
('Squirtle', '1993-04-02', -12.13, FALSE, 3),
('Angemon', '2005-06-12', -45.00, TRUE, 0),
('Boarmon', '2005-06-07', 20.40, TRUE, 7),
('Blossom', '1998-09-13', 17.00, TRUE,3),
('Ditto', '2022-05-14', 22.00, TRUE, 4);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smit', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'), ('Digimon');

UPDATE animals 
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS null;

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon' OR name = 'Boarmon;