# Author: Jay Annadurai
# Date: 25 Mar 2023
# Project: Pathology DB
# Desc: Common/views.py

from django.views.generic import TemplateView

from django.shortcuts import render
from django.urls import get_resolver
from django.views import View


# Establishes Base Super View Class
class BaseView(TemplateView):
    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super().get_context_data(**kwargs)

        # Add in the navigation links to the Various Pages
        # Must be in form of Page_Name:Page:Path
        context['nav_pages'] = {
            # "Home": "App_Static_Content:home",
            "Search": "App_Query:search_input",
            "About Us": "App_Static_Content:about_us",
            "NDD DB": "App_Static_Content:about_project",
            # "Login": "App_Authentication:login"
        }

        # Set the Items for Footer Info in Order
        # Note: the key is discarded but exists for readability
        context['footer_info'] = {
            "Copyright": "ⓒ NDD Pathology DB 2024",
            "Authors": "Stanfield T | Annadurai J | Hamilton N | Cate E",
            "Version": "1.0.0"
        }

        # Return the Context for the Template
        return context


# Establishes a Debug View Class to View Pages
class ListPathsView(View):
    def get(self, request):
        # Get a list of all URL patterns in the Django project
        url_patterns = get_resolver().url_patterns

        # Extract path names from the URL patterns
        path_list = [pattern.pattern._route for pattern in url_patterns]

        # Render a template with the list of paths
        return render(request, 'list_paths.html', {'path_list': path_list})