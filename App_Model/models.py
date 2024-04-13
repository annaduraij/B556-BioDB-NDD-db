# App_Model/models.py

from django.db import models

# Define the SQL Tables here!
# Ideally should mirror the SQL Schema
# Once completed, perform initial migration of the Tables from the Model to the SQL:
# `python manage.py makemigrations App_Model`

# To validate, use the check migration status:
# `python manage.py showmigrations`
# It should have App_Model [X] 0001_initial

# To update, update the migrations of the App_Model:
# `python manage.py migrate App_Model`

# To reset, delete the migrations directory within App_Model
# Once completed, flush the database in Django:
# `python manage.py flush` to reset the database

# Set the standard name for ID and Name Columns
column_ID = 'ID'
column_Name = 'Name'

# Set the maximum length of characters universally
length = {
    'varchar': 255,
    'decimal': {
        'max_digits': 20,
        'decimal_places': 19
    },
}

# Set the Primary Table Names
p_tables = {
    # Table Structure
    # <Model> : {
    #    'db': '< Name of Database Table >'
    #    'abbreviation': '< Abbreviation for usage in intersection tables and columns >'
    #    'admin': '< Name of Table in Django >'
    #    'admin_plural': '< Plural Name of Table in Django >',
    #
    #    'pk': '< Name of Primary Key in DB Table >',
    #    'label': '< Name of Human-Readable Identifier in DB Table >',
    # }

    'Disease': {
        'db': 'Disease',
        'abbreviation': 'Disease',
        'admin': 'Disease',
        'admin_plural': 'Diseases',

        'pk': column_ID,
        'label': column_Name,
    },

    'EnvironmentalRiskFactor': {
        'db': 'Environmental_Risk_Factor',
        'abbreviation': 'ERF',
        'admin': 'Environmental Risk Factor (ERF)',
        'admin_plural': 'Environmental Risk Factors (ERFs)',

        'pk': column_ID,
        'label': column_Name,
    },

    'GeneticRiskFactor': {
        'db': 'Genetic_Risk_Factor',
        'abbreviation': 'GRF',
        'admin': 'Genetic Risk Factor (GRF)',
        'admin_plural': 'Genetic Risk Factors (GRFs)',

        'pk': column_ID,
        'label': 'SNP',
    },
}


# Function to use the original model names and info to create the intersection model names and info
# Standardizes the Naming Convention of Intersection Tables in both DB and Admin Panel
def intersect(primary_model_one, primary_model_two):

    pm1 = p_tables[primary_model_one]
    pm2 = p_tables[primary_model_two]

    i_table_dict = {
        'db': f"{pm1['abbreviation']}_{pm2['abbreviation']}",
        'admin': f"{pm1['admin']} >-< {pm2['admin']}",
        'admin_plural': f"{pm1['admin_plural']} >-< {pm2['admin_plural']}",

        'fk1': f"{pm1['abbreviation']}_{pm1['pk']}",
        'fk2': f"{pm2['abbreviation']}_{pm2['pk']}"
    }

    return i_table_dict


# Set the Intersection / Junction Table Names
i_tables = {
    # Intersection Tables
    'DiseaseERF': intersect('Disease', 'EnvironmentalRiskFactor'),
    'DiseaseGRF': intersect('Disease', 'GeneticRiskFactor'),
}

# Unpack the Primary and Intersection Tables into one Dict
tables = {
    **p_tables,
    **i_tables
}


# Primary Model: Disease
class Disease(models.Model):
    # ID as an integer primary key, automatically incrementing
    id = models.AutoField(primary_key=True, db_column=tables['Disease']['pk'])
    # Name of Disease as a unique, mandatory character field to ensure no duplicates
    name = models.CharField(max_length=length['varchar'], unique=True, db_column=tables['Disease']['label'])
    # Abbreviation of Disease as an optional character field, duplicates allowed
    abbreviation = models.CharField(max_length=length['varchar'], null=True, db_column='Abbreviation')

    # Add the related fields as established by the intersection tables
    grfs = models.ManyToManyField(
        'GeneticRiskFactor',
        through='DiseaseGRF',
        through_fields=("disease_id", "grf_id"),
        related_name='diseases'
    )
    erfs = models.ManyToManyField(
        'EnvironmentalRiskFactor',
        through='DiseaseERF',
        through_fields=("disease_id", "erf_id"),
        related_name='diseases'
    )

    def __str__(self):
        # Sets Disease Tuples' / Instances' Labels to their respective name
        return self.name

    # Table Metadata
    class Meta:
        # Explicitly set the naming of the table in the db
        db_table = tables['Disease']['db']
        # Explicitly set the naming of the table in Django
        verbose_name = tables['Disease']['admin']
        verbose_name_plural = tables['Disease']['admin_plural']


# Primary Model: Environmental Risk Factor
class EnvironmentalRiskFactor(models.Model):
    # ID as an integer primary key, automatically incrementing
    id = models.AutoField(primary_key=True, db_column=tables['EnvironmentalRiskFactor']['pk'])
    # Name of ERF as a unique, mandatory character field to ensure no duplicates
    name = models.CharField(max_length=length['varchar'], unique=True,
                            db_column=tables['EnvironmentalRiskFactor']['label'])

    # diseases = models.ManyToManyField( 'Disease', through='DiseaseERF', related_name='erfs')

    def __str__(self):
        # Sets ERF Tuples' / Instances' Labels to their respective name
        return self.name

    # Table Metadata
    class Meta:
        # Explicitly set the naming of the table
        db_table = tables['EnvironmentalRiskFactor']['db']
        # Explicitly set the naming of the table in Django
        verbose_name = tables['EnvironmentalRiskFactor']['admin']
        verbose_name_plural = tables['EnvironmentalRiskFactor']['admin_plural']


# Primary Model: Genetic Risk Factor
class GeneticRiskFactor(models.Model):
    # ID as an integer primary key, automatically incrementing
    id = models.AutoField(primary_key=True, db_column=tables['GeneticRiskFactor']['pk'])
    # SNP Identifier (functionally equivalent to GRF name) as a unique character field to ensure no duplicates
    snp = models.CharField(max_length=length['varchar'], unique=True, db_column=tables['GeneticRiskFactor']['label'])
    # Mapped Gene's Identifier as a mandatory character field, duplicates allowed, transient dependency
    gene = models.CharField(max_length=length['varchar'], db_column='Gene')
    # Reported Trait as an optional character field, duplicates allowed, transient dependency
    trait = models.CharField(max_length=length['varchar'], null=True, blank=True, db_column='Trait')
    # P Value as an optional (but highly recommended) float field, stored in scientific notation
    p_value = models.FloatField(db_column='P_Value', null=True, blank=True)

    # diseases = models.ManyToManyField( 'Disease', through='DiseaseGRF', related_name='grfs')

    # Decimal Field does not have sufficient max length
    # p_value = models.DecimalField(db_column='P_Value', null=True, blank=True,
    #                               decimal_places=length['decimal']['decimal_places'],
    #                               max_digits=length['decimal']['max_digits'])

    def __str__(self):
        # Sets GRF Tuples' / Instances' Labels to the SNP Identifier
        return self.snp

    # Table Metadata
    class Meta:
        # Explicitly set the naming of the table
        db_table = tables['GeneticRiskFactor']['db']
        # Explicitly set the naming of the table in Django
        verbose_name = tables['GeneticRiskFactor']['admin']
        verbose_name_plural = tables['GeneticRiskFactor']['admin_plural']


# Intersection Model: Diseases >-< Environmental Risk Factors (ERFs)
class DiseaseERF(models.Model):
    # Disease ID as FK
    disease_id = models.ForeignKey(Disease, on_delete=models.CASCADE, db_column=tables['DiseaseERF']['fk1'])
    # Environmental Risk Factor ID as FK
    erf_id = models.ForeignKey(EnvironmentalRiskFactor, on_delete=models.CASCADE, db_column=tables['DiseaseERF']['fk2'])
    # Source (DOI of Document) to validate relationship
    source_DOI = models.CharField(max_length=length['varchar'], db_column='Source_DOI')

    # Table Metadata
    class Meta:
        # Virtual Composite Key enforced via SQL Unique constraints and via Django
        unique_together = [['disease_id', 'erf_id']]
        # Explicitly set the naming of the intersection table
        db_table = tables['DiseaseERF']['db']
        # Explicitly set the naming of the intersection table in Django
        verbose_name = tables['DiseaseERF']['admin']
        verbose_name_plural = tables['DiseaseERF']['admin_plural']


# # Add the Many-to-Many relationship in the Disease Table
# Disease.add_to_class(
#     'erf',
#     models.ManyToManyField(EnvironmentalRiskFactor, through=DiseaseERF)
# )


# Intersection Model: Diseases >-< Genetic Risk Factors (GRFs)
class DiseaseGRF(models.Model):
    # Disease ID as FK
    disease_id = models.ForeignKey(Disease, on_delete=models.CASCADE, db_column=tables['DiseaseGRF']['fk1'])
    # Genetic Risk Factor ID as FK
    grf_id = models.ForeignKey(GeneticRiskFactor, on_delete=models.CASCADE, db_column=tables['DiseaseGRF']['fk2'])
    # Source (Accession Number of Record) to validate relationship
    source_accession = models.CharField(max_length=length['varchar'], db_column='Source_Accession')

    # Table Metadata
    class Meta:
        # Virtual Composite Key enforced via SQL Unique constraints and via Django
        unique_together = [['disease_id', 'grf_id']]
        # Explicitly set the naming of the intersection table
        db_table = tables['DiseaseGRF']['db']
        # Explicitly set the naming of the intersection table in Django
        verbose_name = tables['DiseaseGRF']['admin']
        verbose_name_plural = tables['DiseaseGRF']['admin_plural']


# # Add the Many-to-Many relationship in the Disease Table
# Disease.add_to_class(
#     'grf',
#     models.ManyToManyField(GeneticRiskFactor, through=DiseaseGRF)
# )