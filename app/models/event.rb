class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :has_locations, dependent: :destroy
  accepts_nested_attributes_for :has_locations, :allow_destroy => true
  has_many :has_contacts, dependent: :destroy
  accepts_nested_attributes_for :has_contacts, :reject_if => lambda { |a| a[:contact_name].blank? }, :allow_destroy => true
  has_many :has_socials, dependent: :destroy
  accepts_nested_attributes_for :has_socials, :reject_if => lambda { |a| a[:social_url].blank? }, :allow_destroy => true

  default_scope -> { order('start_date ASC') }
  validates :user_id, presence: true
  validates :event_name, presence:true
  validates :start_date, presence:true
  validates :end_date, presence:true
  validates :event_type, presence:true
  validates :has_socials, presence:false
  validates :event_image, presence: false


  mount_uploader :event_image, ImageUploader

  scope :upcoming_events, where("start_date > ?", Time.zone.now.beginning_of_day())
  scope :past_events, where("start_date < ?", Time.zone.now.beginning_of_day())

  
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids})",
          user_id: user.id)
  end


  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['event_name LIKE ? OR user_id LIKE ?', "%#{search}%", "%#{search}%"])
  #   else
  #    find(:all)
  #   end
  # end
end
