# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'employee_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  puts row
  puts "=="*10
  dept = Department.find_or_create_by(_id: row['department_id'], department_name: row['department_name'], department_id: row['department_id'])
  sec = Section.create([{_id: row['section_id'], section_name: row['section_name'], section_id: row['section_id'], department: dept}])
  Employee.create([{name: row['name'], age: row['age'], gender: row['gender'], salary: row['salary'], section_id: row['section_id'], department_id: row['department_id']}])
end

puts "Records successfully inserted for Department: #{Department.count}, Section: #{Section.count} and Employee: #{Employee.count}"
