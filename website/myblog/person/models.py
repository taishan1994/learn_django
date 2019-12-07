from django.db import models


class Publisher(models.Model):
	id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=64,null=False,unique=True)

	def __str__(self):
		# return "publisher_name:{}".format(self.name)
		return "{}".format(self.name)

class Book(models.Model):
	id = models.AutoField(primary_key=True)
	title = models.CharField(max_length=128,null=False)
	introduce=models.TextField(max_length=120)
	publisher = models.ForeignKey(to='Publisher',on_delete=None)

	def __str__(self):
		return "book_title:{}".format(self.title)
	class Meta:
		ordering=['id']

class Author(models.Model):
	id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=16,null=False)
	book = models.ManyToManyField(to="Book")

	def __str__(self):
		return "author_name:{}".format(self.name)

# Create your models here.
# class Users(models.Model):
# 	gender_text={
# 		('male','男'),
# 		('female','女'),
# 	}
# 	id=models.AutoField(primary_key=True)
# 	username=models.CharField(max_length=20)
# 	name=models.CharField(max_length=20)
# 	gender=models.CharField(max_length=10,choices=gender_text,default='male')
# 	birthday=models.DateField()
# 	birthplace=models.CharField(max_length=50)
# 	address=models.CharField(max_length=50)
# 	career=models.CharField(max_length=20)
# 	hobby_book = models.CharField(max_length=20)
# 	hobby_music=models.CharField(max_length=20)
# 	introduce=models.TextField()

