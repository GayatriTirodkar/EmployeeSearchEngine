require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'department.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  dept = Department.new
  dept.department_name = row['department_name']
  dept.save!
end

puts "Successfully inserted #{Department.count} records in Departments Table"

