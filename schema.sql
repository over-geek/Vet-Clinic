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
