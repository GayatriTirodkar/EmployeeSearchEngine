class Employee
  include Mongoid::Document

  field :name, type: String
  field :age, type: Integer
  field :gender, type: String
  field :salary, type: Integer
  field :department_id, type: String

  index({name:1, department_id:1}, {unique: true})

  validates :name, presence: true
  validates :name, uniqueness: {scope: :department_id}
  validates :gender, inclusion: {in: %w(Male Female), message: "Please specify valid input(Male / Female)"}

  belongs_to :department, inverse_of: :employees

  def self.search term
    puts Employee.where(department_id: term).all
  end
end
