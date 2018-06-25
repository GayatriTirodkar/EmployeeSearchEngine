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

The fully functional app is hosted on https://63216669.ngrok.io.
To add, modify, delete, view list of employees visit https://63216669.ngrok.io/employees
To add, modify, delete, view list of section visit https://63216669.ngrok.io/sections
