# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-06-09 10:14
from __future__ import unicode_literals

from django.db import migrations
import taggit.managers


class Migration(migrations.Migration):

    dependencies = [
        ('people', '0010_auto_20170609_1137'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='interests',
            field=taggit.managers.TaggableManager(help_text='A comma-separated list of tags.', through='people.Taginterest', to='taggit.Tag', verbose_name='Interests'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='skills',
            field=taggit.managers.TaggableManager(help_text='A comma-separated list of tags.', through='taggit.TaggedItem', to='taggit.Tag', verbose_name='Skills'),
        ),
    ]