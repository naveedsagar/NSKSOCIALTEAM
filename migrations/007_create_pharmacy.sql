-- Migration for creating Medicine, Supplier, Prescription, and Prescription_Item tables

CREATE TABLE Medicine (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    dosage VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(id)
);

CREATE TABLE Supplier (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255) NOT NULL
);

CREATE TABLE Prescription (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(255) NOT NULL,
    date DATE NOT NULL
);

CREATE TABLE Prescription_Item (
    id INT PRIMARY KEY AUTO_INCREMENT,
    prescription_id INT,
    medicine_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (prescription_id) REFERENCES Prescription(id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(id)
);