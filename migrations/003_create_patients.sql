-- SQL Migration Script

-- Create the `Patient` table
CREATE TABLE Patient (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Create the `Patient_Visit` table
CREATE TABLE Patient_Visit (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES Patient(id) ON DELETE CASCADE,
    visit_date TIMESTAMP NOT NULL,
    reason VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    CONSTRAINT unique_patient_visit UNIQUE (patient_id, visit_date)
);

-- Indexes
CREATE INDEX idx_patient_name ON Patient(name);
CREATE INDEX idx_patient_visit_patient_id ON Patient_Visit(patient_id);
