class Map < ActiveRecord::Base
	validates :map_image, presence:false
    
    mount_uploader :map_image, ImageUploader
end
