class Department
  include Mongoid::Document
  include Mongoid::Tree

  field :_id, type: String, default: ->{ department_id }
  field :department_id, type: String
  field :department_name, type: String

  index({department_name: 1}, {unique: true})
  index({department_id: 1})

  validates :department_name, presence: true, uniqueness: true
  validates :department_name, uniqueness: {scope: :section_name}

  has_many :employees, inverse_of: :department, dependent: :destroy
  has_many :sections, inverse_of: :department, dependent: :destroy

  validates_associated :employees, :sections

  def self.search_by_name(term, dept)
      depts = Department.where(department_id: dept["department_id"]).only(:_id).map(&:_id)
      Employee.where(:department_id.in => depts, name: term.to_s.capitalize)
  end
end
