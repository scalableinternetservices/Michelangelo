class CreateUnlikes < ActiveRecord::Migration
  def change
    create_table :unlikes do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
