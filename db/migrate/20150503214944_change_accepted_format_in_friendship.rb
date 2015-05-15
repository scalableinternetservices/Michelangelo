class ChangeAcceptedFormatInFriendship < ActiveRecord::Migration
  def change
  	change_column :friendships, :accepted, :integer
  end
end
