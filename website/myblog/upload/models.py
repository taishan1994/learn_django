from django.db import models

# Create your models here.
class File(models.Model):
	image=models.ImageField(upload_to='media')