# Author: Jay Annadurai
# Date: 25 Mar 2023
# Project: Pathology DB
# Desc: App_Static_Content/views.py

from django.views.generic import TemplateView
from Common.views import BaseView


class AboutUsView(BaseView):
    template_name = 'about_us.html'


class AboutProjectView(BaseView):
    template_name = 'about_project.html'
