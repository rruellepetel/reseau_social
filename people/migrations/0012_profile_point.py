# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-06-12 14:09
from __future__ import unicode_literals

import django.contrib.gis.db.models.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('people', '0011_auto_20170609_1214'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='point',
            field=django.contrib.gis.db.models.fields.PointField(null=True, srid=4326),
        ),
    ]
