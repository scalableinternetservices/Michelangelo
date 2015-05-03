class Friendship < ActiveRecord::Base

  # def friends
  #   # friender_friends_ids = "SELECT friender_id FROM friendships
  #   #                         WHERE friended_id = :user_id"
  #   friended_friends_ids = "SELECT friended_id FROM friendships
  #                           WHERE friender_id = :user_id"

  #   # User.where("id IN (#{friender_friends_ids}) OR
  #   #       id IN (#{friended_friends_ids})", user_id: self.id)
  #   #   .alphabetize
  #   User.where("id IN (#{friended_friends_ids})")
  #      .alphabetize

  #   end
end
