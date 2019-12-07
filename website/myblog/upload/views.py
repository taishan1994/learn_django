import os

from django.http import HttpResponse
from django.shortcuts import render
from django.shortcuts import redirect
# Create your views here.

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
upload_path=os.path.join(BASE_DIR,'media')

def upload(request):
	return render(request,'file/upload.html')

def save_upload(request):
	if request.method=='POST':
		myfile=request.FILES.get('myfile',None)
		if not myfile:
			return HttpResponse("您没选择任何文件")
		destination=open(os.path.join(upload_path,myfile.name),'wb+')
		for chunk in myfile.chunks():
			destination.write(chunk)
		destination.close()
		return HttpResponse("上传成功")