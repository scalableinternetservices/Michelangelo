class AddSharetypeToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :sharetype, :integer
  end
end
