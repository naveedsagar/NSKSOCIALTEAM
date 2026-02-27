-- SQL Migration for Bill and Payment Tables with Audit Fields

CREATE TABLE billing (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now(),
    deleted_at TIMESTAMP
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    bill_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    method VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now(),
    deleted_at TIMESTAMP
);

-- Add foreign key constraints
ALTER TABLE payments ADD CONSTRAINT fk_bill FOREIGN KEY (bill_id) REFERENCES billing(id);