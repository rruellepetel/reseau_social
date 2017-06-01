from django.conf.urls import url
from .views import ProfileDetailView,ProfileListView,ProfileUpdate

urlpatterns = [
    url(r'^list$', ProfileListView.as_view(), name="profile-list"),
    url(r'^(?P<slug>[\w-]+)/edit$', ProfileUpdate.as_view(), name="profile-update"),
    url(r'^(?P<slug>[\w-]+)', ProfileDetailView.as_view(), name="profile-detail"),


]
