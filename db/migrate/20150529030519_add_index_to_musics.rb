class AddIndexToMusics < ActiveRecord::Migration
  def change
  	add_index :musics, :uid
  end
end
