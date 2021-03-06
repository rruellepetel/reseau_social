from django.conf.urls import url
from .views import ProfileDetailView,ProfileListView,ProfileUpdate,ProfileMapView

urlpatterns = [
    url(r'^list$', ProfileListView.as_view(), name="profile-list"),
    url(r'^map$', ProfileMapView.as_view(), name="profile-map"),
    url(r'^(?P<slug>[\w-]+)/edit$', ProfileUpdate.as_view(), name="profile-update"),
    url(r'^(?P<slug>[\w-]+)', ProfileDetailView.as_view(), name="profile-detail"),
]
