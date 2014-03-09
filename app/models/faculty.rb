class Faculty < ActiveRecord::Base
	validates :faculty_name, presence: true, length: { maximum: 50 }
    validates :faculty_short_name, presence: true, length: {maximum:2}
    validates :faculty_type, presence: true, length: { maximum: 50 }
end