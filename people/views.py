# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, reverse
from django.views.generic.detail import DetailView
from django.views.generic import ListView
from .models import Profile
from django.views.generic.edit import UpdateView

# Create your views here.

# def homepage(request):
#
#     return render(request, "homepage.html")

# def profile_detail(request,slug):
#     detail = Profile.objects.get(user__username=slug)
#
#     context = {
#         "detail":detail
#     }
#     return render(request, "profile_detail.html", context)

class ProfileDetailView(DetailView):
    model = Profile
    slug_field = "user__username"
    # context_object_name = "user"

# def profile_list(request):
#     profiles = Profile.objects.all()
#     context = {
#         "profiles":profiles
#     }
#     return render(request, "people/profile_list.html", context)

class ProfileListView(ListView):
    model = Profile
    context_object_name = "profiles"


class ProfileUpdate(UpdateView):
    model = Profile
    slug_field = "user__username"
    fields = ['address', 'zip_Code', 'city', 'website', 'contact_Email', 'avatar', 'skills', 'interests']

    def get_success_url(self):
        return reverse('profile-detail', kwargs={'slug' : self.object.user.username})
