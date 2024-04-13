# Author: Jay Annadurai
# Date: 25 Mar 2023
# Project: Pathology DB
# Desc: App_Query/urls.py

from django.urls import path

app_name = 'App_Query'

from .views import (
    SearchInputView,
    #SearchResultsView,
    #RecordDetailsView
)

urlpatterns = [
    path('', SearchInputView.as_view(), name='search_input'),
    #path('results/', SearchResultsView.as_view(), name='search_results'),
    #path('record/<int:id>/', RecordDetailsView.as_view(), name='record_details'),
]
