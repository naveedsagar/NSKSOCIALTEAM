from django.db import models

class Patient(models.Model):
    name = models.CharField(max_length=100)
    age = models.IntegerField(validators=[MinValueValidator(0)])
    GENDER_CHOICES = [(‘M’, ‘Male’), (‘F’, ‘Female’), (‘O’, ‘Other’)]
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES)
    contact_info = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        indexes = [models.Index(fields=[‘name’])]


class Doctor(models.Model):
    name = models.CharField(max_length=100)
    specialization = models.CharField(max_length=100)
    contact_info = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        indexes = [models.Index(fields=[‘name’])]


class Appointment(models.Model):
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    appointment_date = models.DateTimeField()
    STATUS_CHOICES = [(‘scheduled’, ‘Scheduled’), (‘completed’, ‘Completed’), (‘cancelled’, ‘Cancelled’)]
    status = models.CharField(max_length=10, choices=STATUS_CHOICES)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Billing(models.Model):
    appointment = models.OneToOneField(Appointment, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    PAYMENT_STATUS_CHOICES = [(‘paid’, ‘Paid’), (‘pending’, ‘Pending’), (‘overdue’, ‘Overdue’)]
    payment_status = models.CharField(max_length=10, choices=PAYMENT_STATUS_CHOICES)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Medication(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Diagnosis(models.Model):
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    diagnosis_date = models.DateTimeField()
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Prescription(models.Model):
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    medication = models.ForeignKey(Medication, on_delete=models.CASCADE)
    prescription_date = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Treatment(models.Model):
    patient = models.OneToOneField(Patient, on_delete=models.CASCADE)
    treatment_date = models.DateTimeField()
    treatment_type = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Insurance(models.Model):
    patient = models.OneToOneField(Patient, on_delete=models.CASCADE)
    company_name = models.CharField(max_length=100)
    policy_number = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class AuditLog(models.Model):
    model_name = models.CharField(max_length=100)
    action_type = models.CharField(max_length=50)
    performed_by = models.CharField(max_length=100)
    timestamp = models.DateTimeField(auto_now_add=True)