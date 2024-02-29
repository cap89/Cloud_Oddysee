class AddCoordinatesToClouds < ActiveRecord::Migration[7.1]
  def change
    add_column :clouds, :latitude, :float
    add_column :clouds, :longitude, :float
  end
end
