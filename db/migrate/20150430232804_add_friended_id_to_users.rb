class AddFriendedIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :friended_id, :integer
  end
end
