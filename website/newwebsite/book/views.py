from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import render,redirect,reverse
from django.urls import resolve
from django.views.decorators.http import require_http_methods
from django.views import View
from .models import Student
from django.db.models import Count,Sum,Avg,Max,Min
from .forms import RegisterForms,StudentForms

class IndexForms(View):
	def get(self,request):
		forms =RegisterForms()
		return render(request,'index.html',{'forms':forms})
	def post(self,request):
		forms =RegisterForms(request.POST)
		if forms.is_valid():
			username=forms.cleaned_data.get('username')
			password = forms.cleaned_data.get('password')
			repassword = forms.cleaned_data.get('repassword')
			age = forms.cleaned_data.get('age')
			gender = forms.cleaned_data.get('gender')
			hobby = forms.cleaned_data.get('hobby')
			birthday = forms.cleaned_data.get('birthday')
			introduce = forms.cleaned_data.get('introduce')
			# print([username,password,repassword,birthday,age,gender,hobby,introduce])
			context={
				'datalist':{
					'username':username,
					'password':password,
					'repassword':repassword,
					'age': age,
					'gender': gender,
					'hobby': hobby,
					'birthday':birthday,
					'introduce':introduce,
				}
			}
			return render(request,'home.html',context=context)
		else:
			return HttpResponse('Sorry')


class IndexStudent(View):
	def get(self,request):
		forms=StudentForms()
		return render(request,'index.html',{'forms':forms})
	def post(self,request):
		forms=StudentForms(request.POST)
		if forms.is_valid():
			# name=forms.cleaned_data.get('name')
			# age = forms.cleaned_data.get('age')
			# gender= forms.cleaned_data.get('gender')
			# is_deleted=forms.cleaned_data.get('is_deleted')
			# introduce = forms.cleaned_data.get('introduce')
			# context={
			# 	'datalist':{
			# 		'name':name,
			# 		'age':age,
			# 		'gender':gender,
			# 		'id_deleted':is_deleted,
			# 		'introduce':introduce,
			# 	}
			# }
			forms.save()
			# return render(request,'home.html',context=context)
			return HttpResponse("OK...")
		else:
			return HttpResponse('Sorry...')










# Create your views here.
def index(request):
	student_list=Student.objects.aggregate(Count('name'))
	context={
		'res':student_list,
	}
	return render(request,"index.html",context)

def news(request):
	return render(request,"news.html")

def sports(request):
	return render(request,"sports.html")

# def index(request):
# 	return render(request,"search.html")
# def page_not_found(request,exception=404):
# 	return render(request,template_name="404.html")

# def index(request):
# 	username = request.GET.get("username")
# 	if username is not None:
# 		return HttpResponse("welcome!")
# 	else:
# 		path=request.path
# 		current_namespace=resolve(path).namespace
# 		return redirect(reverse('{}:loose'.format(current_namespace),kwargs={'a':100,'b':200}))
#
# def error(request,a,b):
# 	sum=a+b
# 	return HttpResponse("<h1>path:{}</h1>".format(request.path))
#
# def page(request,pn=1):
# 	return HttpResponse("<h1>{}</h1>".format(pn))
#def index(request):
#	return render(request,"index.html")

#def search(request):
#	search=request.GET.get("query")
#	return HttpResponse('<h1>{}</h1>'.format(search))


#def index(request):
#	return render(request,'index.html')

#def news(request):
#	return HttpResponse('我是新闻的首页页面')

#def videos(request):
#	return HttpResponse('我是视频的首页页面')

# def web(request):
# 	html="<h1>Djang Web</h1>"
# 	return HttpResponse(html)
#
# def trans(request,html):
# 	return HttpResponse("<h1>{}</h1>".format(html))
#
# def trans2(request,page):
# 	return HttpResponse("<h1>{}</h1>".format(page))
#
# def trans3(request,numa,numb):
# 	return HttpResponse("<h1>{}</h1>".format(numa+numb))
#
# def trans4(request,slugStr):
# 	return HttpResponse("<h1>{}</h1>".format(slugStr))
#
# def trans5(request,uu):
# 	return HttpResponse("<h1>{}</h1>".format(uu))
#
# def trans6(request,home):
# 	return HttpResponse("<h1>{}</h1>".format(home))
