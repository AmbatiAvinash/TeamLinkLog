class AddColumnsToLink < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :archive, :boolean, :null => false, :default => false 
    add_column :links, :favorite, :boolean
  end
end
