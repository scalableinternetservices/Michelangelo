class Music < ActiveRecord::Base
  
  has_many   :comments, dependent: :destroy
  has_many   :likes, dependent: :destroy

  validates :link, presence: true
  validates :comment, presence: true
  validates :uid, presence: true

  def user
  	User.find(self.uid)
  end

  def comments
  	Comment.where(post_id: self.id)
  end

  def likecount
  	Like.where(post_id: self.id).count
  end

end



