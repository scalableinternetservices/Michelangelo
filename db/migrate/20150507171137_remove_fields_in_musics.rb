class RemoveFieldsInMusics < ActiveRecord::Migration
  def change
  	remove_column :musics, :title, :string
  	remove_column :musics, :artist, :string
  	remove_column :musics, :hashtag, :string
  end
end
