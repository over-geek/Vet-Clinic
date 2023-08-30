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

-- treatments table create
CREATE TABLE treatments (
  id serial PRIMARY KEY,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL
);

-- invoices table
CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id)
);

-- invoice_items table
CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL NOT NULL,
  invoice_id INT REFERENCES medical_histories(id),
  treatments_id INT REFERENCES treatments(id)
);

-- join table
CREATE TABLE medical_histories_treatments (
  id INT PRIMARY KEY,
  medical_histories_id INT REFERENCES medical_histories(id),
  treatments_id INT REFERENCES treatments(id)
);

-- Create an index for the patient_id in the medical_histories table
CREATE INDEX patient_id_idx ON medical_histories(patient_id);

-- Create an index for the medical_history_id in the invoices table
CREATE INDEX medical_history_id_idx ON invoices(medical_history_id);

-- Create an index for the invoice_items table
CREATE INDEX invoice_id_idx ON invoice_items (invoice_id);
CREATE INDEX treatments_id_idx ON invoice_items (treatments_id);

-- Create an index for the medical_histories_treatments table
CREATE INDEX medHisTreat_medHisId_idx ON medical_histories_treatments (medical_histories_id);
CREATE INDEX medHisTreat_treatmentsId_idx ON medical_histories_treatments (treatments_id);