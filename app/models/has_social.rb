class HasSocial < ActiveRecord::Base
	belongs_to :event
	validates :social_links, presence: false
end
