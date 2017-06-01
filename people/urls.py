from django.conf.urls import url
from .views import homepage, profile_detail

urlpatterns = [
    url(r'^profile/(?P<slug>[\w-]+)$', profile_detail, name="profile-detail"),
    url(r'^$', homepage, name="homepage"),

]
