/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id bigserial not null,
    name varchar(100) not null,
    date_of_birth date,
    escape_attempts int not null,
    neutered boolean,
    weight_kg decimal not null,
    primary key(id)
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