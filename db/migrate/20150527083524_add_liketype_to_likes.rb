class AddLiketypeToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :liketype, :integer
  end
end
