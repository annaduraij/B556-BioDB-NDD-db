# Author: Jay Annadurai
# Date: 25 Mar 2023
# Project: Pathology DB
# Desc: App_Static_Content/urls.py

from django.urls import path

app_name = 'App_Static_Content'

from .views import (
    AboutUsView,
    AboutProjectView
)

urlpatterns = [
    path('about-us/', AboutUsView.as_view(), name='about_us'),
    path('about-project/', AboutProjectView.as_view(), name='about_project'),
]
