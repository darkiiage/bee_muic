class Location < ActiveRecord::Base
	validates :map_number, presence: true, uniqueness: { case_sensitive: false },
			  numericality: { only_integer: true }
    validates :location_name, presence: true, uniqueness: { case_sensitive: false }
end
