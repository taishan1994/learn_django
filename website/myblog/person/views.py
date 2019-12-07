import json
from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render, redirect
from .models import Book, Publisher
from django.core.paginator import Paginator, EmptyPage


# Create your views here.
def index(request):
	return render(request,'index/index.html')
def about(request):
	return render(request, 'about/about.html')
def life(request):
	return render(request, 'life/newlist.html')
def doing(request):
	return render(request, 'doing/moodlist.html')
def learn(request):
	return render(request, 'learn/knowledge.html')

def test(request,pn=1):
	book_obj=Book.objects.all()
	paginator=Paginator(book_obj,2)
	print(paginator.get_page(1))
	page=paginator.page(pn)
	print(page)
	context={'page':page}
	return render(request,'test/test.html',context=context)


def curd_index(request,pn=1):
	#获取前端收到的查询的值，默认值为空
	query=request.GET.get('query')
	#如果存在，则对title和publisher进行模糊查询
	if query:
		book_obj = Book.objects.all().filter(Q(title__contains=query)|Q(publisher__name__contains=query))
	#否则取得所有的记录
	else:
		query=''
		book_obj=Book.objects.all()
	#将差得的记录传给Paginator，每页显示5条
	paginator=Paginator(book_obj,5)
	#这里做异常判断，稍后再讲
	try:
		page=paginator.page(pn)
	except EmptyPage:
		page=paginator.page(1)
	#将page和查询字段传给前端
	context={
		'page':page,
		'query':query,
	}
	return render(request,'curd/curd.html',context=context)

def curd_delete(request):
	#从前端(html)获取did数据
	did=request.GET.get('did')
	if did:
		#找到该数据，将其删除
		Book.objects.get(id=did).delete()
		#删除成功，返回显示页
		return redirect('/curd/')

def curd_delete_all(request):
	#先判断发过来的是否是post请求
	if request.method=="POST":
		#得到要删除的id列表
		values=request.POST.getlist('vals')
		for i in values:
			#如果id不为空，获取该字段，并将其删除，我们只删除book表，publisher表不变
			if i != '':
				book_obj = Book.objects.get(id=i)
				book_obj.delete()
		#删除成功返回显示页
		return redirect('/curd/')

def curd_edit(request):
	#我们先获得要编辑的书籍的id
	eid=request.GET.get('eid')
	#得到书籍信息
	book_obj=Book.objects.get(id=eid)
	publisher_obj=Publisher.objects.all()
	#蒋书记信息和出版社信息一起传入到前端，应为我们出版社是和书籍关联的，只能够选择，不能随意添加。
	content = {
		'book':book_obj,
		'publisher':publisher_obj,
	}
	return render(request,'curd/edit.html',context=content)

def curd_save_edit(request):
	#判断表单过来的是否是post请求
	if request.method == 'POST':
		#如果是，则获取到相应的信息
		bookid=request.POST.get("book_id")
		title=request.POST.get('title')
		publisher=request.POST.get('publisher')
		introduce=request.POST.get('introduce')
		publisher_obj=Publisher.objects.get(name=publisher)
		#因为我们是通过publisher_id进行关联的，在更新的时候，只能插入相对应的id，不能直接插入出版社名称
		id=publisher_obj.id
		#执行更新操作
		Book.objects.filter(id=bookid).update(title=title,publisher_id=id,introduce=introduce)
		return redirect('/curd/')

def curd_add(request):
	#我们这不对publisher表进行增加，只是增加book表，所以我们的publisher直接获取给前台用
	publisher_obj=Publisher.objects.all()
	content={
		'publisher':publisher_obj,
	}
	return render(request,'curd/add.html',context=content)

def curd_save_add(request):
	#判断是否是POST请求
	if request.method == 'POST':
		title=request.POST.get('title')
		publisher=request.POST.get('publisher')
		introduce=request.POST.get('introduce')
		publisher_obj=Publisher.objects.get(name=publisher)
		#由于publisher表与book是关联关系，因此增加时publisher必须是对象
		Book.objects.create(title=title,introduce=introduce,publisher=publisher_obj)
		return redirect('/curd/')
