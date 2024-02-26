class AddPictureUrlToClouds < ActiveRecord::Migration[7.1]
  def change
    add_column :clouds, :picture_url, :string
  end
end
