# Generated by Django 2.2.6 on 2019-11-06 06:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='users',
            name='password',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='users',
            name='repassword',
            field=models.CharField(max_length=50),
        ),
    ]
