class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.text :comment
      t.integer :uid

      t.timestamps
    end
    add_attachment :audios, :audioFile
  end
end
