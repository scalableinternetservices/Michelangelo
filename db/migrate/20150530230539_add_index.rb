class AddIndex < ActiveRecord::Migration
  def change
  	add_index :comments, :post_id
  	add_index :friendships, :friender_id
  	add_index :friendships, :friended_id
  	add_index :musics, :uid
  	add_index :unreadcomments, :commenter
  	add_index :unreadcomments, :user_id

  end
end
