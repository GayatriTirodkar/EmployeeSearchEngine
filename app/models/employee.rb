class Employee
  include Mongoid::Document

  field :name, type: String
  field :age, type: Integer
  field :gender, type: String
  field :salary, type: Integer
  field :department_id, type: String
  field :section_id, type: String

  index({name:1, department_id: 1, section_id: 1}, {unique: true})

  validates :name, presence: true, uniqueness: true
  validates :name, uniqueness: {scope: [:department_id, :section_id]}
  validates :age, length: {maximum: 3, too_long: "%{count} characters is the maximum allowed"}
  validates :age, numericality: { only_integer: true }
  validates :gender, inclusion: {in: %w(Male Female), message: "Please specify valid input(Male / Female)"}

  belongs_to :department, inverse_of: :employees
  belongs_to :section, inverse_of: :employees
  validates :department, :section, presence: true

end
