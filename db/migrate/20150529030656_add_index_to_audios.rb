class AddIndexToAudios < ActiveRecord::Migration
  def change
  	add_index :audios, :uid
  end
end
