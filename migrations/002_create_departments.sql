-- SQL Migration for creating Departments table

CREATE TABLE Departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX idx_department_name ON Departments(name);

-- Add Audit Fields
ALTER TABLE Departments ADD COLUMN created_by VARCHAR(255);
ALTER TABLE Departments ADD COLUMN updated_by VARCHAR(255);
