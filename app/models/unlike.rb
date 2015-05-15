class Unlike < ActiveRecord::Base
  belongs_to :music
  belongs_to :user

  validates :post_id,      presence: true
  validates :user_id, presence: true

  before_save :check_duplicate

  def check_duplicate
    (Unlike.where(  post_id: self.post_id, 
                  user_id: self.user_id ).exists?) ? false : true
  end
end
