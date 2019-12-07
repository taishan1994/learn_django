from django.contrib import admin
from .models import Student

# Register your models here.
# class ArticlesAdmin(admin.ModelAdmin):
# 	list_display = ['id','title','content','author']

class StudentAdmin(admin.ModelAdmin):
	list_display = ['id','name','age','gender','introduce']

admin.site.register(Student,StudentAdmin)