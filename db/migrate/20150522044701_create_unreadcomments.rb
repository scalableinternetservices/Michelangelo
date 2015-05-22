class CreateUnreadcomments < ActiveRecord::Migration
  def change
    create_table :unreadcomments do |t|
      t.integer :comment_id
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
