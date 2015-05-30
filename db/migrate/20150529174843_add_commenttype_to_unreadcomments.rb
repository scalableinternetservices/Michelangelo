class AddCommenttypeToUnreadcomments < ActiveRecord::Migration
  def change
    add_column :unreadcomments, :commenttype, :integer
  end
end
