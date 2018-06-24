class Section
  include Mongoid::Document
 
  field :section_name, type: String
  field :department_id, type: String

  index({section_name:1, department_id:1}, {unique: true})

  validates :section_name, presence: true, uniqueness: true
  validates :section_name, uniqueness: {scope: :department_id}

  belongs_to :department, inverse_of: :employees

  def self.search_by_section(term)
      puts "yes here"
      puts "=="*20
      depts = Section.where(section_name: term).only(:department_id).map(&:department_id)
      Employee.where(:department_id.in => depts)
  end

end
