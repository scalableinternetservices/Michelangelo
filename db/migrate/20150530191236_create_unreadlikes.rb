class CreateUnreadlikes < ActiveRecord::Migration
  def change
    create_table :unreadlikes do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :liker
      t.integer :liketype

      t.timestamps
    end
  end
end
