from django.urls import path
from . import views

app_name='person'
urlpatterns=[
	path('',views.index,name='index'),
	path('about/',views.about,name='about'),
	path('life/',views.life,name='life'),
	path('doing/',views.doing,name='doing'),
	path('learn/',views.learn,name='learn'),
	path('test/', views.test),
	path('test/<int:pn>',views.test,name='test'),
	path('curd/',views.curd_index),
	path('curd/<int:pn>',views.curd_index,name="curdindex"),
	path('curd/delete/',views.curd_delete,name='curddelete'),
	path('curd/deleteall/',views.curd_delete_all,name='curddeleteall'),
	path('curd/edit/',views.curd_edit,name='curdedit'),
	path('curd/saveedit/',views.curd_save_edit,name='curdsaveedit'),
	path('curd/add/',views.curd_add,name='curdadd'),
	path('curd/saveadd/',views.curd_save_add,name='curdsaveadd'),
]