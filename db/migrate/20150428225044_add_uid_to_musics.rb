class AddUidToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :uid, :integer
  end
end
