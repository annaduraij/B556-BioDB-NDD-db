# Author: Jay Annadurai
# Date: 25 Mar 2023
# Project: Pathology DB
# Desc: App_Query/views.py

from django.views.generic import TemplateView
from Common.views import BaseView


class SearchInputView(BaseView):
    template_name = 'search_input.html'


class SearchResultsView(BaseView):
    template_name = 'search_results.html'


class RecordDetailsView(BaseView):
    template_name = 'record_details.html'
