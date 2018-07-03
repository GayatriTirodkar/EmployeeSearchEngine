#Readme

The Application retrives Employee data based on the department to which the Employee belongs to.
Employee belongs to only one Department but Department can have multiple Employees


The app uses Ruby 2.4.1 and Rails 5.2.0

Initial steps:

    Clone this repository
    bundle install --without production
    rake db:seed #to populate database with some predefined data

To get this application running follow the below steps:

    Execute rails server
    Open the browser and type 'http://localhost:3000/'

Application URLs:

    The fully functional app is hosted on http://localhost:3000/
    To add, modify, delete, view list of employees visit http://localhost:3000/employees
    To add, modify, delete, view list of section visit http://localhost:3000/sections

    Please note: Enter ids for the fields labelled as Department/Section
