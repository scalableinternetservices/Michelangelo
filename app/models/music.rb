class Music < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true
  validates :link, presence: true
  validates :hashtag, presence: true
  validates :uid, presence: true

  def user(uid)
  	User.find(uid)
  end
end



