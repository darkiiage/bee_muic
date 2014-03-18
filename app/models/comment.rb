class Comment < ActiveRecord::Base
	belongs_to :event
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :event_id, presence: true
	validates :comment_content, presence: true
end
