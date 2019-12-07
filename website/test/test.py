import datetime

from django.contrib.auth.hashers import make_password

a='12345'
b='123456'
print(make_password(a))
print(make_password(b))