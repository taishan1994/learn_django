from django.contrib import admin
from django.urls import path
from . import views
from django.conf.urls import handler404
# app_name ="book"
urlpatterns = [
	path('',views.index,name="index"),
	path('news/',views.news,name="news"),
	path('sports/',views.sports,name="sports"),
	path('register/',views.IndexForms.as_view(),name='register'),
	path('student/',views.IndexStudent.as_view(),name='student'),
	# path('page<int:pn>/',views.page,name="page"),
	# path('page/',views.page),
	# path('', views.index,name='index'),
	# path('error/<int:a>/<int:b>', views.error,name='loose'),
	# path('search/',views.search,name='search'),
	# path('news/', views.news,name='news'),
	# path('videos/', views.videos,name='videos'),

	# path('', views.index),
	# path('web/', views.web),
	# path('19/0425/<str:html>',views.trans),
	# path('19/0425/<int:page>',views.trans2),
	# path('19/0425/<int:numa>/<int:numb>',views.trans3),
	# path('19/0425/<slug:slugStr>',views.trans4),
	# path('19/0425/<uuid:uu>',views.trans5),
	# path('19/0425/<path:home>',views.trans6),
]
# handler404=views.page_not_found