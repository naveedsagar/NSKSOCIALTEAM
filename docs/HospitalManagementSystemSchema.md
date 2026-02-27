# Hospital Management System Database Schema Documentation

## Introduction
This document outlines the database schema for the Hospital Management System, detailing the entities, their attributes, and relationships between them, formatted as an Entity-Relationship (ER) diagram.

## Entities and Attributes

### 1. Patient
- **PatientID** (Primary Key)
- FirstName
- LastName
- DateOfBirth
- Gender
- PhoneNumber
- Email
- Address
- AdmissionDate

### 2. Doctor
- **DoctorID** (Primary Key)
- FirstName
- LastName
- Specialty
- PhoneNumber
- Email

### 3. Appointment
- **AppointmentID** (Primary Key)
- PatientID (Foreign Key)
- DoctorID (Foreign Key)
- AppointmentDate
- Status

### 4. Treatment
- **TreatmentID** (Primary Key)
- AppointmentID (Foreign Key)
- TreatmentDescription
- TreatmentDate

### 5. Invoice
- **InvoiceID** (Primary Key)
- PatientID (Foreign Key)
- AmountDue
- PaymentStatus
- DueDate

## Relationships
- A **Patient** can have multiple **Appointments** (1 to many).
- A **Doctor** can attend multiple **Appointments** (1 to many).
- Each **Appointment** can have multiple **Treatments** (1 to many).
- Each **Patient** can have multiple **Invoices** (1 to many).

## ER Diagram
Here is a simplified version of the ER diagram (text representation):

```
Patient (PatientID) ---< Appointment (AppointmentID) >--- Doctor (DoctorID)
                       |                                 |
                       |                                 |
                       |---< Treatment (TreatmentID)    |

Patient (PatientID) ---< Invoice (InvoiceID)
```

## Conclusion
This documentation provides a structured overview of the Hospital Management System's database schema. Further refinements can be made to suit specific requirements.