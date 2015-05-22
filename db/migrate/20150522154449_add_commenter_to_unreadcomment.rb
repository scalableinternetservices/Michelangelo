class AddCommenterToUnreadcomment < ActiveRecord::Migration
  def change
  	add_column :unreadcomments, :commenter, :integer
  end
end
