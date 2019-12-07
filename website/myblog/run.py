import datetime
import os

from django.db.models import Q

if __name__ == '__main__':
	#加载Django项目的配置信息
	os.environ.setdefault("DJANGO_SETTINGS_MODULE","myblog.settings")
	#导入Django,并启动Django项目
	import django
	django.setup()

	# from person import models
	from login import models
	try:
		user_obj = models.Users.objects.get(phone='112')
	except models.Users.DoesNotExist:
		print('账号不存在')
	from django.contrib.auth.hashers import make_password

	a = '123456'
	b = '123456'
	print(make_password(a))
	print(make_password(b))