class Music < ActiveRecord::Base
  
  acts_as_taggable
  

  has_many   :comments, :foreign_key => :post_id, dependent: :destroy
  has_many   :likes, :foreign_key => :post_id, dependent: :destroy
  has_many   :allcomments, ->{where(post_id: self.id, commenttype: 0 ).order("created_at DESC")}, class_name: 'Comment'
  has_many   :top3comments, ->{where(post_id: self.id, commenttype: 0).order("created_at DESC").limit(3)}, class_name: 'Comment'


  validates :link, presence: true
  # validates :comment, presence: true
  validates :uid, presence: true

  def user
  	User.find(self.uid)
  end


 # def allcomments
 #    Comment.where(post_id: self.id, commenttype: 0 ).order("created_at DESC")
 #  end


 #  def top3comments
 #    Comment.where(post_id: self.id, commenttype: 0).order("created_at DESC").limit(3)
 #  end


  def likecount
  	Like.where(post_id: self.id, liketype: 0).count
  end

  


end



