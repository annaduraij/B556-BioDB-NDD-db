# Author: Jay Annadurai
# Date: 25 Mar 2023
# Project: Pathology DB
# Desc: App_Authentication/views.py

from django.views.generic import TemplateView
from Common.views import BaseView


class LoginView(BaseView):
    template_name = 'login.html'


class LogoutView(BaseView):
    template_name = 'logout.html'


class RegisterView(BaseView):
    template_name = 'register.html'
