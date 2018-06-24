class Department
  include Mongoid::Document
 
  field :_id, type: String, default: ->{ department_id }
  field :department_id, type: String
  field :department_name, type: String

  index({department_name: 1})
  index({department_id: 1})
  

  validates :department_name, presence: true, uniqueness: true

  has_many :employees, inverse_of: :department, dependent: :destroy

  def self.search_by_name(term)
      depts = Department.where(department_name: term).only(:_id).map(&:_id)
      Employee.where(:department_id.in => depts)
  end
end
