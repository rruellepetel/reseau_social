from django.conf.urls import url
from .views import homepage, profile

urlpatterns = [
    url(r'^profile$', profile, name="profile"),
    url(r'^$', homepage, name="homepage"),

]
