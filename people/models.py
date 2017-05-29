# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User


# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    address = models.CharField(max_length=100)
    zip_Code = models.CharField(max_length=5)
    city = models.CharField(max_length=75)
    website = models.CharField(max_length=150)
    contact_Email = models.EmailField(max_length=150)
    avatar = models.ImageField(null=True)
    skills = models.CharField(max_length=1000)
    interests = models.CharField(max_length=1000)
