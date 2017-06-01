# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from .models import Profile

# Create your views here.

def homepage(request):

    return render(request, "homepage.html")

def profile_detail(request,slug):
    detail = Profile.objects.get(user__username=slug)

    context = {
        "detail":detail
    }
    return render(request, "profile_detail.html", context)
