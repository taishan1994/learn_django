# Generated by Django 2.2.6 on 2019-11-06 03:16

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Users',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('phone', models.CharField(max_length=20)),
                ('username', models.CharField(max_length=20)),
                ('password', models.CharField(default=123, max_length=20)),
                ('repassword', models.CharField(default=123, max_length=20)),
                ('birthday', models.DateField()),
                ('regday', models.DateField()),
            ],
        ),
    ]
