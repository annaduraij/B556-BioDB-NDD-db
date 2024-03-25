# Neurodegenerative Disease Pathology DB

---
_Django Project Config by Jay Annadurai_

---


## Introduction
Welcome to the Neurodegenerative Disease Pathology DB repository! 
This guide will help you set up the project on your local development environment.

## Prerequisites
Before getting started, make sure you have the following installed:
- Python 3.12 (Core Python)
- pip (Python package manager)
- MySQL server and client (MariaDB with phpMyAdmin from XAMPP used)
  - Uses ```mysqlclient``` package to connect with MySQL

## Setup Instructions
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/annaduraij/B556-PathologyDB.git
   ```
   ```bash 
   cd B556-PathologyDB
   ```
   
2. **Setup MySQL Database**:
    - Use MySQL Client of Choice (MariaDB with PhpMyAdmin or MySQL with MySQL Workbench)
    - Import ```pathology_db.sql```
    - Initialize a User Account
3. **Configure SQL Connection Settings**:
   - Open Pathology_Project/settings.py file in the project directory.
   - Find the DATABASES setting and configure it with your MySQL database settings:
   ```python
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'pathology_db', # Name of the DB
            'USER': 'client_username', # Name of the Account to Access DB
            'PASSWORD': 'client_password', # Password of the Account to Access DB
            'HOST': 'localhost', # Default Host
            'PORT': '3306', # Default MySQL Port
        }
    }
    ```
4. **Run Model Migrations**
   - Django analyzes existing database and generates models from the database schema
   - In a terminal set to the Project Directory (```cd B556-PathologyDB```)
   - Perform the ```migrate``` command on the management script
      ```bash
      python manage.py migrate
      ``` 
5. **Create a Superuser (Admin) to access Django Admin Interface**
   - Not immediately necessary!
   - In a terminal set to the Project Directory (```cd B556-PathologyDB```)
   - Perform the ```createsuperuser``` command on the management script
     ```bash
     python manage.py migrate
     ``` 
   - Follow prompts to establish the Super Admin
6. **Access the Development Server**
   - Required to integrate all the templates and components
   - In a terminal set to the Project Directory (```cd B556-PathologyDB```)
   - Perform the ```runserver``` command on the management script
     ```bash
     python manage.py runserver
     ``` 
   - Preview Django Application at the Development Server ```http://127.0.0.1:8000```
