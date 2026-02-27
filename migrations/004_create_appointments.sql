-- Migration script for creating the Appointment table with audit fields and indexes

CREATE TABLE Appointment (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    appointment_date TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    CONSTRAINT fk_user
        FOREIGN KEY(user_id) 
        REFERENCES Users(id)
);

CREATE INDEX idx_appointment_user_id ON Appointment(user_id);
CREATE INDEX idx_appointment_date ON Appointment(appointment_date);