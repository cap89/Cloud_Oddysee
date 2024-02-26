class RenameTypeColumnInClouds < ActiveRecord::Migration[7.1]
  def change
    rename_column :clouds, :type, :category
  end
end
