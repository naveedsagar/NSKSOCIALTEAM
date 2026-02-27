# API Documentation for Hospital Modules

## Overview
This API provides access to the hospital management system functionalities. It allows interaction with various modules, including patient management, appointment scheduling, billing, and more.

## Authentication
All requests to the API must include an authentication token. You can obtain the token by logging into the system. Include it in the headers of your requests:

```
Authorization: Bearer YOUR_TOKEN_HERE
```

## Endpoints

### 1. Patient Management
#### Create Patient
- **Endpoint:** `POST /api/patients`
- **Description:** Creates a new patient record.
- **Request Body:**
  ```json
  {
      "name": "string",
      "dob": "yyyy-mm-dd",
      "gender": "string",
      "contact": "string"
  }
  ```
- **Response:** 201 Created

#### Get Patient Details
- **Endpoint:** `GET /api/patients/{id}`
- **Description:** Retrieves details of a specific patient.
- **Response:** 200 OK with patient details.

### 2. Appointment Scheduling
#### Create Appointment
- **Endpoint:** `POST /api/appointments`
- **Description:** Schedule a new appointment.
- **Request Body:**
  ```json
  {
      "patientId": "string",
      "doctorId": "string",
      "date": "yyyy-mm-dd",
      "time": "HH:mm:ss"
  }
  ```
- **Response:** 201 Created

### 3. Billing
#### Get Bill Details
- **Endpoint:** `GET /api/billing/{patientId}`
- **Description:** Retrieves billing information for a specific patient.
- **Response:** 200 OK with billing details.

## Error Codes
- **400**: Bad Request
- **401**: Unauthorized
- **404**: Not Found
- **500**: Internal Server Error

## Examples
### Sample Request (Create Patient)
```bash
curl -X POST /api/patients \
-H "Authorization: Bearer YOUR_TOKEN_HERE" \
-H "Content-Type: application/json" \
-d '{"name": "John Doe", "dob": "1980-01-01", "gender": "male", "contact": "1234567890"}'
```

### Sample Response
```json
{
    "id": "1",
    "name": "John Doe",
    "dob": "1980-01-01",
    "gender": "male",
    "contact": "1234567890"
}
```