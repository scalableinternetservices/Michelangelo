class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password

  has_many :friendships
  has_many :users, through: :friendships

  has_attached_file :image, :styles => { :small => "150x150" },
                    :url => "/assets/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  # validates_attachment_presence :image
  # validates_attachment_size :image, :less_than => 5.megabytes
  # validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  after_destroy :ensure_an_admin_remains
  

  def friends
    friender_friends_ids = "SELECT friender_id FROM friendships
                            WHERE friended_id = :user_id AND accepted = 1"
    friended_friends_ids = "SELECT friended_id FROM friendships
                            WHERE friender_id = :user_id AND accepted = 1"

    User.where("id IN (#{friender_friends_ids}) OR
          id IN (#{friended_friends_ids})", user_id: self.id)
    
    # User.where("id IN (#{friended_friends_ids})",user_id: self.id)
       
  end

  def requests_from
    # frienders_ids = "SELECT friender_id FROM friendships 
    #                  WHERE friended_id = :user_id AND accepted = false"
    frienders_ids = "SELECT friender_id FROM friendships 
                     WHERE friended_id = :user_id And accepted = 0"

    User.where("id IN (#{frienders_ids})", user_id: self.id)
  end

  def friend_request(friended)
    friender_id = self.id 
    # friended_id = params[:id] # this is the id of the user you want to become friend with
    friendship = Friendship.create(friender_id: friender_id, friended_id: friended.id, accepted: 0)
  end

   def friend_request_accept(friender)
  # accepting a friend request is done by the recipient of the friend request.
  # thus the current user is identified by friended_id.
  friendship = Friendship.where(friended_id: self.id,  friender_id: friender.id).first
  friendship.update_attributes(accepted: 1)
end

def friend_request_reject(friender)
  friendship = Friendship.where(friended_id: self.id,  friender_id: friender.id).first
  friendship.destroy
end

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end     
end
