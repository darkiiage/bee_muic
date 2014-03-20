class EventType < ActiveRecord::Base
	validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :image, presence:false
    
    mount_uploader :image, ImageUploader
end
