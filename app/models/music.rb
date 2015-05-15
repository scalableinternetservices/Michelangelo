class Music < ActiveRecord::Base
  
  has_many   :comments, :foreign_key => :post_id, dependent: :destroy
  has_many   :likes, :foreign_key => :post_id, dependent: :destroy
  has_many   :unlikes, :foreign_key => :post_id, dependent: :destroy

  validates :link, presence: true
  validates :comment, presence: true
  validates :uid, presence: true

  def user
  	User.find(self.uid)
  end


  def comments
  	Comment.where(post_id: self.id).order("created_at DESC")
  end

  def likecount
  	Like.where(post_id: self.id).count
  end

  def unlikecount
    Unlike.where(post_id: self.id).count
  end


end



