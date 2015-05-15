class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :title
      t.string :artist
      t.text :comment
      t.string :hashtag
      t.string :link

      t.timestamps
    end
  end
end
