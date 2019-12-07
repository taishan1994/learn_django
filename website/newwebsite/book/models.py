from django.db import models

# Create your models here.
# class Articles(models.Model):
# 	title=models.CharField('标题',max_length=20)
# 	author=models.CharField('作者',max_length=20)
# 	content=models.TextField('内容')
class Student(models.Model):
	#字段映射，数据库中是male,female，后台显示的是男，女
	choices={
		('male',"男"),
		('female','女'),
	}
	#创建数据库中的字段
	name=models.CharField(verbose_name='姓名',max_length=20,unique=True)
	age=models.CharField(verbose_name='年龄',max_length=10)
	gender=models.CharField(verbose_name='性别',max_length=10,choices=choices,default='male')
	# is_deleted=models.BooleanField(verbose_name='是否删除',default=1)
	introduce=models.TextField(verbose_name='介绍')

	def __str__(self):
		return self.name

	class Meta:
		# verbose_name_plural='新闻'
		# verbose_name="新闻列表"
		#修改排列的顺序，这句是靠id从大到小排序
		ordering=['-id']
		db_table = 'student'
