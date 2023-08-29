-- Patients table Create
CREATE TABLE IF NOT EXISTS patients (
    id serial PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE
);

-- medical histories table creation
CREATE TABLE IF NOT EXISTS medical_histories (
    id serial PRIMARY KEY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(255) NOT NULL
);
