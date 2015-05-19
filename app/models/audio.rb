class Audio < ActiveRecord::Base
	has_many   :comments, :foreign_key => :post_id, dependent: :destroy
    has_many   :likes, :foreign_key => :post_id, dependent: :destroy

	has_attached_file :audioFile

	# validates_attachment_size :audioFile, :less_than => 5.megabytes
  	validates_attachment_content_type :audioFile, :content_type => ['audio/basic', 'audio/mid', 'audio/mpeg', 'audio/mp3' , 'audio/mp4' , 'audio/m4a' , 'audio/x-m4a' , 'audio/x-wav']

  validates :audioFile, presence: true
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




end
