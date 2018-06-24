class Section
  include Mongoid::Document
 
  field :_id, type: String, default: ->{ section_id }
  field :section_id, type: String
  field :section_name, type: String
  field :department_id, type: String

  index({section_name:1, department_id:1}, {unique: true})

  validates :section_name, presence: true
  validates :section_name, uniqueness: {scope: :department_id}

  has_many :employees, inverse_of: :section, dependent: :destroy
  belongs_to :department, inverse_of: :sections
  

  def self.search_by_section(term)
      depts = Section.where(section_name: term.to_s.upcase).only(:department_id).map(&:department_id)
      Employee.where(:department_id.in => depts)
  end

end
