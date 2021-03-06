# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-06-15 12:01
from __future__ import unicode_literals

from django.conf import settings
import django.contrib.gis.db.models.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('people', '0012_profile_point'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProfileTranslation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('language_code', models.CharField(db_index=True, max_length=15, verbose_name='Language')),
                ('bio', models.CharField(max_length=1000, verbose_name='Bio')),
            ],
            options={
                'managed': True,
                'db_table': 'people_profile_translation',
                'db_tablespace': '',
                'default_permissions': (),
                'verbose_name': 'profile Translation',
            },
        ),
        migrations.AlterField(
            model_name='profile',
            name='address',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='adresse'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='avatar',
            field=models.ImageField(blank=True, null=True, upload_to=b'', verbose_name='avatar'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='city',
            field=models.CharField(blank=True, max_length=75, null=True, verbose_name='ville'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='contact_Email',
            field=models.EmailField(blank=True, max_length=150, null=True, verbose_name='email contact'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='point',
            field=django.contrib.gis.db.models.fields.PointField(null=True, srid=4326, verbose_name='point'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='utilisateur'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='website',
            field=models.CharField(blank=True, max_length=150, null=True, verbose_name='site web'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='zip_Code',
            field=models.CharField(blank=True, max_length=5, null=True, verbose_name='code postal'),
        ),
        migrations.AddField(
            model_name='profiletranslation',
            name='master',
            field=models.ForeignKey(editable=False, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='translation', to='people.Profile'),
        ),
        migrations.AlterUniqueTogether(
            name='profiletranslation',
            unique_together=set([('language_code', 'master')]),
        ),
    ]
