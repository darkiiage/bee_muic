class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  default_scope -> { order('start_date DESC') }
  validates :user_id, presence: true
  validates :event_name, presence:true

  
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids})",
          user_id: user.id)
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['event_name LIKE ? OR user_id LIKE ?', "%#{search}%", "%#{search}%"])
    else
     find(:all)
    end
  end
end
