/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id bigserial primary key,
    name varchar(100) not null,
    date_of_birth date,
    escape_attempts int not null,
    neutered boolean,
    weight_kg decimal not null
);

ALTER TABLE animals ADD COLUMN species VARCHAR;

CREATE TABLE owners (
    id bigserial primary key,
    full_name varchar(255),
    age int
);

CREATE TABLE species (
    id bigserial primary key,
    name varchar(255)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id int;
ALTER TABLE animals ADD CONSTRAINT foreign_key_species FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id int;
ALTER TABLE animals ADD CONSTRAINT foreign_key_owners FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id BIGSERIAL PRIMARY KEY,
    name varchar,
    age int,
    date_of_graduation DATE
);

CREATE TABLE specializations(
    vet_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
    PRIMARY KEY(vet_id, species_id)
)

CREATE TABLE visits (
    id BIGSERIAL PRIMARY KEY,
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Add an index to the animal_id column of the visits table
CREATE INDEX animal_id_idx ON visits (animal_id);

-- Add an index to the vet_id column of the visits table
CREATE INDEX vet_id_idx ON visits (vet_id);