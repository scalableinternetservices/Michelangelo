class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :friender_id
      t.integer :friended_id
      t.boolean :accepted
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
