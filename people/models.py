# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.db import models
from autoslug import AutoSlugField
from django.contrib.auth.models import User
from taggit.managers import TaggableManager


# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    address = models.CharField(max_length=100, null=True, blank=True)
    zip_Code = models.CharField(max_length=5, null=True, blank=True)
    city = models.CharField(max_length=75, null=True, blank=True)
    website = models.CharField(max_length=150, null=True, blank=True)
    contact_Email = models.EmailField(max_length=150, null=True, blank=True)
    avatar = models.ImageField(null=True, blank=True)
    skills = TaggableManager()
    interests = TaggableManager(related_name='+')



@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
       Profile.objects.create(user=instance)
