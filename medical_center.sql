-- Schema design for medical center db

DROP DATABASE IF EXISTS medical_centers;

CREATE DATABASE medical_centers;

\c medical_centers

-- medical centers

CREATE TABLE centers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT,
  phone_number TEXT UNIQUE
);

INSERT INTO centers
(name, address, phone_number)
VALUES
('Baptist', '123 south st', '445-665-0987'),
('Nicks', '456 north ave', '123-123-1122'),
('Cancer institute', '222 west block', '111-555-1234'),
('Geriatric Health', '888 east drive', '222-333-4567');

-- doctors

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NuLL,
  specialization TEXT
);

INSERT INTO doctors
(name, specialization)
VALUES
('john pork', 'animals'),
('Bob Ross', 'the soul'),
('Dr. Marco', 'physician'),
('Pedro Morales', 'Gastro');

-- patients

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  insurance TEXT
);

INSERT INTO patients
(name, insurance)
VALUES
('Sarah Johnson', 'Obamacare'),
('John J. Johnson', 'Ambetter'),
('Alfred Gomez', 'Ambetter'),
('Jeon Park', 'Miamicare');

-- Diseases

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  curable BOOLEAN
);

INSERT INTO diseases
(name, curable)
VALUES
('Tuberculosis', TRUE),
('COVID-19', FALSE),
('FLU', FALSE),
('eczema', TRUE);

-- relational tables
-- medical center employs several doctors

CREATE TABLE centers_doctors
(
  id SERIAL PRIMARY KEY,
  center_id INTEGER REFERENCES centers,
  doctor_id INTEGER REFERENCES doctors
);

INSERT INTO centers_doctors
(center_id, doctor_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 2),
(2, 3),
(3, 4),
(4, 1),
(4, 4);

-- you can now join the centers)_doctor table with both centers and doctors to better vizualize the relationships
-- doctors can each have many patients and vice versa

CREATE TABLE doctors_patients
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors,
  patient_id INTEGER REFERENCES patients
);

INSERT INTO doctors_patients
(doctor_id, patient_id)
VALUES
(1, 1),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 3),
(3, 4),
(4, 4);

-- a patient may have more than one disease

CREATE TABLE patients_diseases
(
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients,
  disease_id INTEGER REFERENCES diseases
);

INSERT INTO patients_diseases
(patient_id, disease_id)
VALUES
(1, 1),
(1, 2),
(4, 1);
