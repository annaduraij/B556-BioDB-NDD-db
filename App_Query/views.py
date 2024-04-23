# Author: Jay Annadurai
# Date: 25 Mar 2023
# Project: Pathology DB
# Desc: App_Query/views.py

# Importing TemplateView because it is the base class that BaseView extends
# Likely redundant
from django.views.generic import TemplateView

# BaseView is a custom class that extends TemplateView and acts as the Super View
# It has common context data that is used in all Views
from Common.views import BaseView

# reverse_lazy is used for lazy evaluation of the reverse URL resolution
# This is useful for when URLs need to be resolved before the project URL conf is loaded
# Used in the Form
from django.urls import reverse_lazy

# # FormView is a view for hybrid forms that displays a form on GET and processes it on POST
# # Makes form handling easier
# # Contains methods that handle form validation and redirection after form submission
# from django.views.generic.edit import FormView

# Importing the specific SearchForm to use for the Main Search Input View
from .forms import SearchForm

# Import Data Models
from App_Model.models import Disease, GeneticRiskFactor, EnvironmentalRiskFactor
# Allow for Query Objects that let you chain keyword arguments
from django.db.models import Q


class SearchInputView(BaseView):
    template_name = 'search_input.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        query = self.request.GET.get('query', '')  # Default to empty string if not provided
        search_type = self.request.GET.get('type', '')

        if query:  # Only perform search if there is a query
            results = self.retrieve_results(query, search_type)
            context.update({
                'results': results,
                'query': query,
                'search_type': search_type,
            })
        return context

    @staticmethod
    def retrieve_results(query, search_type):
        if search_type == 'disease':
            # Fetch diseases that match the query and prefetch related genetic and environmental factors
            results = (
                Disease.objects
                .filter(
                    Q(name__icontains=query) | Q(abbreviation__icontains=query)
                )
                # # Fetch the related genetic and environmental risk factors
                # .prefetch_related('grf', 'erf')
            )

        elif search_type == 'genome':
            # Fetch genetic factors that match the query and also prefetch related diseases
            results = (
                GeneticRiskFactor.objects
                .filter(
                    Q(snp__icontains=query) | Q(gene__icontains=query) | Q(trait__icontains=query)
                )
                # Fetch related diseases and environmental risk factors related to those diseases
                .prefetch_related('diseases')
            )

        elif search_type == 'environment':
            # Fetch environmental factors that match the query and also prefetch related diseases
            results = (
                EnvironmentalRiskFactor.objects
                .filter(
                    Q(name__icontains=query)
                )
                # Fetch related diseases and genetic risk factors related to those diseases
                .prefetch_related('diseases')
            )

        else:
            results = ["No Results Found"]

        return results



# # SearchInputView handles the display and processing of the search form
# # It inherits from BaseView for common context data and FormView for form handling
# class SearchInputView(BaseView, FormView):
#     # Specifies the template to use when rendering this view
#     template_name = 'search_input.html'
#     # Specifies the form class to use with this view
#     form_class = SearchForm
#     # Config to enable redirecting to a results page
#     view_in_results = False
#
#     # URL to redirect to on successful form submission
#     success_url = reverse_lazy('App_Query:search_input')
#
#     # Dynamically get the success URL
#     def get_success_url(self):
#         if self.view_in_results:
#             return reverse_lazy('App_Query:search_results')
#         return reverse_lazy('App_Query:search_input')
#
#     if view_in_results:
#         # Set the redirect URL to the Results page
#         success_url = reverse_lazy('App_Query:search_results')
#
#     # Get context data
#     def get_context_data(self, **kwargs):
#         # Ensure the form is included in context data for initial GET requests
#         context = super().get_context_data(**kwargs)
#         if 'form' not in context:
#             context['form'] = self.form_class()
#         return context
#
#     # Static Method to Retrieve Results
#     @staticmethod
#     def retrieve_results(query, search_type):
#         # Fetches the results based on the search type and query
#         if search_type == 'disease':
#             return Disease.objects.filter(name__icontains=query)
#         elif search_type == 'grf':
#             return GeneticRiskFactor.objects.filter(snp__icontains=query)
#         elif search_type == 'erf':
#             return EnvironmentalRiskFactor.objects.filter(name__icontains=query)
#         else:
#             return []
#
#     # This method is automatically called when valid form data has been POSTed
#     # Binds the user query, the query type, and possibly the results
#     def form_valid(self, form):
#         # Get any form Data by using the get Context Argument
#         context = self.get_context_data(form=form)
#
#         # Retrieve the Query and Bind to the User Session
#         query = form.cleaned_data['query']
#         self.request.session['query'] = query
#
#         # Retrieve the Search Type
#         search_type = form.cleaned_data['type']
#         self.request.session['search_type'] = search_type
#
#         # If the input page is also set to list records
#         # AKA it does not redirect to a results page
#         if not self.view_in_results:
#             # Bind the Query Results
#             results = self.retrieve_results(query, search_type)
#
#             # Set the Context Array to contain the Results Data
#             context['results'] = results
#
#             # Set the context Array to get the Search Type
#             context['search_type'] = search_type
#
#         return super(SearchInputView, self).form_valid(form)



# # SearchResultsView displays the search results
# # It inherits from BaseView to utilize the common context data provided
# class SearchResultsView(BaseView):
#     template_name = 'search_results.html'
#     # The get_context_data method is where you would add the code to fetch and add search results to the context.
#     # This would typically fetch data based on 'query' and 'search_type' stored in the session.
#
#
# # RecordDetailsView displays details for a specific record
# # It also inherits from BaseView to make use of common functionality like footer and navigation setup
# class RecordDetailsView(BaseView):
#     template_name = 'record_details.html'
#     # TODO: display details based on the record ID
