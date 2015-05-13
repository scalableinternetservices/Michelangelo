class Like < ActiveRecord::Base
  belongs_to :music
  belongs_to :user
 # has_many   :likes, as: :likeable, dependent: :destroy

  validates :post_id,      presence: true
  validates :user_id, presence: true
end
