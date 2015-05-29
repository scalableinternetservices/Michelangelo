class AddIndexToUnreadcomments < ActiveRecord::Migration
  def change
  	add_index :unreadcomments, :post_id
  	add_index :unreadcomments, :commenter
  end
end
