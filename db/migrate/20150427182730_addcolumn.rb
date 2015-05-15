class Addcolumn < ActiveRecord::Migration
  def change
      add_column :users, :gender, :string
      add_column :users, :age, :string
      add_column :users, :interest, :string
      add_column :users, :picurl, :string
      
  end
end
