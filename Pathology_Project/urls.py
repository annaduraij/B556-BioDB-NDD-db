# Author: Jay Annadurai
# Date: 25 Mar 2023
# Project: Pathology DB

# Pathology_Project/urls.py

"""
URL configuration for Pathology_Project project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# Default Imports
from django.contrib import admin
from django.urls import path

# Import the 'Include' to Include App URLs
from django.urls import include

# Temporarily Import the AboutProjectView and AboutUsView to set as the home page
from App_Static_Content.views import AboutProjectView
from App_Static_Content.views import AboutUsView
from Common.views import ListPathsView

urlpatterns = [
    # Admin Path
    path('admin/', admin.site.urls),

    # Custom URL View for listing paths
    path('debug/paths/', ListPathsView.as_view(), name='list_paths'),

    # Home Path temporarily routes to the AboutProjectView
    path('', AboutProjectView.as_view(), name='Home'),

    # URLs for App_Query to handle Database Transactions
    path('db/', include('App_Query.urls')),

    # URLs for App_Authentication to handle Authentication Transactions
    # path('auth/', include('App_Authentication.urls')),

    # URLs for App_Static_Content for any Static Pages
    path('s/', include('App_Static_Content.urls')),  # URLs for App_Static_Content
]
