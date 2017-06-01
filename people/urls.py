from django.conf.urls import url
from .views import homepage, ProfileDetailView,ProfileListView

urlpatterns = [
    url(r'^profile/list$', ProfileListView.as_view(), name="profile-list"),
    url(r'^profile/(?P<slug>[\w-]+)$', ProfileDetailView.as_view(), name="profile-detail"),
    url(r'^$', homepage, name="homepage"),

]
