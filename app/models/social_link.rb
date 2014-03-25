class SocialLink < ActiveRecord::Base
	mount_uploader :social_image, ImageUploader
	validates :social_name, presence: true
	validates :social_image, presence: false
end

