# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.db import models
from autoslug import AutoSlugField
from django.contrib.auth.models import User
from taggit.managers import TaggableManager
from taggit.models import TaggedItemBase
from django.contrib.gis.db import models as geomodels
from django.utils.translation import ugettext as _

# Create your models here.
class Taginterest(TaggedItemBase):
    content_object = models.ForeignKey('Profile')


class Profile(geomodels.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name=_("user"))
    address = models.CharField(max_length=100, null=True, blank=True, verbose_name=_("adresse"))
    zip_Code = models.CharField(max_length=5, null=True, blank=True, verbose_name=_("code postal"))
    city = models.CharField(max_length=75, null=True, blank=True, verbose_name=_("ville"))
    website = models.CharField(max_length=150, null=True, blank=True, verbose_name=_("site web"))
    contact_Email = models.EmailField(max_length=150, null=True, blank=True, verbose_name=_("email contact"))
    avatar = models.ImageField(null=True, blank=True, verbose_name=_("avatar"))
    skills = TaggableManager(verbose_name=_("Skills"))
    interests = TaggableManager(through=Taginterest, related_name='profile_interests',verbose_name=_("Interests"))

    point = geomodels.PointField(null=True, verbose_name=_("point"))
