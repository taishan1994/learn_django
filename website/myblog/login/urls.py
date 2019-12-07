from django.urls import path
from . import views

app_name='login'
urlpatterns=[
	path('',views.login,name='login'),
	path('register/',views.register,name='register'),
	path('register/savereg/',views.save_register,name='savereg'),
	path('tologin/',views.to_login,name='tologin'),
	path('logout/',views.logout,name='logout'),
	path('index/',views.index,name='index'),
 ]