from django import forms
from .models import Student


class RegisterForms(forms.Form):
	# test=forms.Field(required=False,label='测试用',initial='请输入用户名',help_text='请输入用户名',
	# label_suffix='>>>')
	choices={
		(1,'男'),(2,'女'),(3,'保密')
	}
	hobbies=[(1,'足球'),(2,'篮球'),(3,'读书')]
	formats=[
		'%Y-%m-%d',
		'%m/%d/%Y',
	]
	year_list=[
		1990,1991,1995,2001
	]
	username=forms.CharField(min_length=4,max_length=10,label='用户名',
							 widget=forms.TextInput(attrs={'class':'custom-forms'}),help_text='请输入姓名')
	password=forms.CharField(widget=forms.PasswordInput(attrs={'class':'custom-forms'}),min_length=4,max_length=8,label='输入密码')
	repassword=forms.CharField(widget=forms.PasswordInput(attrs={'class':'custom-forms'}),min_length=4,max_length=8,label='确认密码')
	age=forms.IntegerField(widget=forms.NumberInput(attrs={'class':'custom-forms'}),label='年龄',min_value=18,max_value=120)
	gender=forms.ChoiceField(choices=choices,label='性别',initial=1)
	# email=forms.EmailField(widget=forms.EmailInput(attrs={'class':'custom-forms'}),label='邮箱')
	# phone=forms.CharField(widget=forms.TextInput(attrs={'class':'custom-forms'}),max_length=11,label='电话')
	hobby = forms.MultipleChoiceField(label='爱好', choices=hobbies, widget=forms.CheckboxSelectMultiple)
	birthday=forms.DateField(label='出生日期',input_formats=formats)
	introduce=forms.CharField(widget=forms.Textarea(attrs={'class':'custom-forms'}),label='自我介绍')


class StudentForms(forms.ModelForm):
	formats=[
		'%Y-%m-%d',
		'%m/%d/%Y',
	]
	# birthday = forms.DateField(label='出生日期', input_formats=formats)
	class Meta:
		model=Student
		# fields='__all__'
		# exclude=['is_deleted']
		fields=['name','age','gender','introduce']
		# fields = ['name']
		widgets={
			'name':forms.TextInput(attrs={'class':'custom-textinput'})
		}
		help_texts={
			'name':'请输入姓名',
		}
		labels={
			'name':'姓名',
			'age':'年龄',
			'gender':'性别',
			'introduce':'介绍',
		}
		# error_messages={
		# 	'name':{
		# 		'required':'...',
		# 		'min_length':'...',
		# 		'max_length':'...',
		# 	}
		# }

