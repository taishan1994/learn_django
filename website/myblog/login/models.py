from django.db import models

# Create your models here.
class Users(models.Model):
	id=models.AutoField(primary_key=True)
	phone=models.CharField(max_length=20)
	username=models.CharField(max_length=20)
	password=models.CharField(max_length=50)
	repassword=models.CharField(max_length=50)
	birthday=models.DateField()
	regday=models.DateField()


