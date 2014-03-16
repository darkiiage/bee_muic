class Faculty < ActiveRecord::Base

	before_save { self.faculty_short_name = faculty_short_name.upcase }
	before_save { self.faculty_name = faculty_name.capitalize  }

	validates :faculty_name, presence: true, length: { maximum: 50 },
			  uniqueness: { case_sensitive: false }
    validates :faculty_short_name, presence: true, length: {maximum:2},
              uniqueness: { case_sensitive: false }
    validates :faculty_type, presence: true, length: { maximum: 50 }

end