# Author: Jay Annadurai
# Date: 25 Mar 2023
# Project: Pathology DB
# Desc: App_Authentication/urls.py

from django.urls import path

app_name = 'App_Authentication'

from .views import (
    LoginView,
    LogoutView,
    RegisterView
)

urlpatterns = [
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('register/', RegisterView.as_view(), name='register'),
]
