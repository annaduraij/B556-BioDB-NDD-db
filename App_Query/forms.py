# Author: Jay Annadurai
# Date: 12 Apr 2023
# Project: Pathology DB
# Desc: App_Query/forms.py

# App_Query/forms.py
from django import forms


class SearchForm(forms.Form):
    # Define choices for the radio buttons, each choice is a tuple (value, label)
    CHOICES = [('disease', 'Disease'), ('genome', 'Genetic Factor'), ('environment', 'Environmental Factor')]
    # CharField corresponds to <input type="text"> in HTML, used for user input
    query = forms.CharField(label='Search', max_length=200)
    # Manually force the ChoiceField type into Radio Buttons
    type = forms.ChoiceField(choices=CHOICES, widget=forms.RadioSelect)
