class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password

  has_attached_file :image, :styles => { :small => "150x150" },
                    :url => "/assets/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  after_destroy :ensure_an_admin_remains
  

  def friends
    # friender_friends_ids = "SELECT friender_id FROM friendships
    #                         WHERE friended_id = :user_id"
    friended_friends_ids = "SELECT friended_id FROM friendships
                            WHERE friender_id = :user_id"

    # User.where("id IN (#{friender_friends_ids}) OR
    #       id IN (#{friended_friends_ids})", user_id: self.id)
    #   .alphabetize
    User.where("id IN (#{friended_friends_ids})",user_id: self.id)
       
    end

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end     
end
