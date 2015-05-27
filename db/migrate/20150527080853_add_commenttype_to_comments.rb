class AddCommenttypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commenttype, :integer
  end
end
