class Like < ActiveRecord::Base
  belongs_to :music
  belongs_to :user

  
 # has_many   :likes, as: :likeable, dependent: :destroy

  validates :post_id,      presence: true
  validates :user_id, presence: true

  before_save :check_duplicate

  def check_duplicate
    (Like.where(  post_id: self.post_id, 
                  user_id: self.user_id ).exists?) ? false : true
  end

end
