-- Migration for Surgery table

CREATE TABLE Surgery (
    id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL,
    procedure_name VARCHAR(255) NOT NULL,
    surgeon VARCHAR(255) NOT NULL,
    surgery_date TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by VARCHAR(255) NOT NULL,
    deleted_at TIMESTAMP,
    CONSTRAINT fk_patient
      FOREIGN KEY(patient_id) 
      REFERENCES Patient(id)
      ON DELETE CASCADE
);

-- Indexes
CREATE INDEX idx_surgery_patient_id ON Surgery(patient_id);

-- Triggers for auditing can be added here if needed.