# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
=begin
csv_text = File.read(Rails.root.join('lib', 'seeds', 'department.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  Department.find_or_create_by(department_name: row['department_name'])
  #dept = Department.new
  #dept.department_name = row['department_name']
  #dept.save!
end

puts "Successfully inserted #{Department.count} records in Departments Table"


csv_text = File.read(Rails.root.join('lib', 'seeds', 'employee_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  #employee = Employee.new
  #employee.name = row['name']
  #employee.age = row['age']
  #employee.gender = row['gender']
  #employee.salary = row['salary']
  #employee.save!
  Employee.find_or_create_by(name: row['name'], age: row['age'], gender: row['gender'], salary: row['salary'])
end

puts "Successfully inserted #{Employee.count} records in Employees Table"

=end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'employee_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  puts row
  puts "=="*10
  dept = Department.find_or_create_by(_id: row['department_id'], department_name: row['department_name'], department_id: row['department_id'])
  Employee.create([{name: row['name'], age: row['age'], gender: row['gender'], salary: row['salary'], department: dept}])
end
