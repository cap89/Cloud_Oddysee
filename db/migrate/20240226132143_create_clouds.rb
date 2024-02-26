class CreateClouds < ActiveRecord::Migration[7.1]
  def change
    create_table :clouds do |t|
      t.string :name
      t.string :type
      t.text :description
      t.string :address
      t.date :available_from
      t.date :available_until
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
