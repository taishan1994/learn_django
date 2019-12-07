from django.contrib.auth.hashers import make_password
from django.http import HttpResponse
from django.shortcuts import render, redirect
from .models import Users
import datetime

# Create your views here.
def login(request):
	if request.get_signed_cookie('username', salt='SSS', default=None) != None:
		username = request.get_signed_cookie('username', salt='SSS', default=None)
		return render(request, 'login/index.html', {'username': username})
	return render(request,'login/login.html')
def register(request):
	return render(request,'login/register.html')

def save_register(request):
	if request.method == 'POST':
		phone=request.POST.get('phone')
		username=request.POST.get('username')
		password=request.POST.get('password')
		repassword=request.POST.get('repassword')
		birthday=request.POST.get('birthday')
		errormsg=''
		if phone =='':
			errormsg='手机号不能为空'
		elif password =='':
			errormsg='密码不能为空'
		else:
			if password!=repassword:
				errormsg='确认密码与密码不一致'
		if errormsg == '':
			Users.objects.create(phone=phone,username=username,password=password,birthday=birthday,
								 regday=datetime.datetime.now().strftime('%Y-%m-%d'))
			return render(request,'login/pagejump.html')
		else:
			return render(request,'login/register.html',context={'errormsg':errormsg})

def to_login(request):
	if request.method == 'POST':
		phone=request.POST.get('phone')
		remember=request.POST.get('remember')
		if phone == '':
			return render(request, 'login/login.html', {'errormsg': '用户名不能为空'})
		try:
			user_obj = Users.objects.get(phone=phone)
		except Users.DoesNotExist:
			return render(request,'login/login.html',{'errormsg':'账号不存在,请重新输入'})
		pwd=user_obj.password
		password = request.POST.get('password')
		if password != '':
			repwd=password
			if pwd == repwd:
				username=user_obj.username
				if remember is not None:
					response = render(request, 'login/index.html',{'username':username})
					response.set_signed_cookie("username", username, salt="SSS", max_age=60 * 60 * 12)
					return response
				else:
					return render(request, 'login/index.html', {'username': username})
				# return render(request, 'login/index.html',{'username':username})
			else:
				return render(request, 'login/login.html',{'errormsg':'密码错误'})
		else:
			return render(request, 'login/login.html', {'errormsg': '密码不能为空'})

def check_login(func):
	def helper(request,*args,**kwargs):
		if request.get_signed_cookie('username',salt='SSS',default=None) != None:
			return func(request,*args,**kwargs)
		else:
			return render(request,'login/checklogin.html')
	return helper

def logout(request):
	response = redirect("/login/")
	response.delete_cookie("username")
	return response


@check_login
def index(request):
	return render(request,'login/index.html')