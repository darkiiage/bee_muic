class Comment < ActiveRecord::Base
	belongs_to :commentable, :polymorphic => true
	default_scope -> { order('like DESC') }
	validates :comment_content, presence: true, length: { maximum: 140 }
end
