class Music < ActiveRecord::Base

  validates :link, presence: true
  validates :comment, presence: true
  validates :uid, presence: true

  def user
  	User.find(self.uid)
  end

end



