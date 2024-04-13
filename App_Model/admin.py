# Author: Jay Annadurai
# Date: 12 April 2024
# Project: Pathology DB
# Desc: App_Model/admin.py

from django.contrib import admin
from .models import Disease, EnvironmentalRiskFactor, GeneticRiskFactor, DiseaseERF, DiseaseGRF


# @admin.register(<ModelClass>)
# class <ModelClass>Admin
#   # Note these Fields are the names of the bound variables in the model, not db columns
#   list_display = ( <Field1 to Display>, <Field2 to Display>, ... )
#   search_fields = ( <Field1 to Search Through>, <Field2 to Search Through>, ... )
#   list_filter = ( <Field1 to Filter By>, <Field2 to Filter By>, ... )
#   # Note, intersection table fields can use the FK__ForeignField, for example grf_id__snp, gets snp through grf_id
#   # Note to the Note, but the '__' spanning syntax does not apply to list fields

@admin.register(Disease)
class DiseaseAdmin(admin.ModelAdmin):
    list_display = ('name', 'abbreviation')
    search_fields = ('name', 'abbreviation')
    list_filter = ('name', 'abbreviation',)


@admin.register(EnvironmentalRiskFactor)
class EnvironmentalRiskFactorAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ('name',)


@admin.register(GeneticRiskFactor)
class GeneticRiskFactorAdmin(admin.ModelAdmin):
    list_display = ('snp', 'gene', 'trait', 'p_value')
    search_fields = ('snp', 'gene', 'trait')
    list_filter = ('trait', 'gene')


@admin.register(DiseaseERF)
class DiseaseERFAdmin(admin.ModelAdmin):
    list_display = ('disease_id', 'erf_id', 'source_DOI')
    search_fields = ('disease_id__name', 'erf_id__name', 'source_DOI')
    list_filter = ('disease_id__name', 'erf_id__name')


@admin.register(DiseaseGRF)
class DiseaseGRFAdmin(admin.ModelAdmin):
    list_display = ('disease_id', 'grf_id', 'source_accession')
    search_fields = ('disease_id__name', 'grf_id__snp', 'grf_id__gene', 'grf_id__trait', 'source_accession')
    list_filter = ('disease_id__name', 'grf_id__snp', 'grf_id__gene', 'grf_id__trait',)
