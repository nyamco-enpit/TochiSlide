class CreateLandslides < ActiveRecord::Migration
  def change
    create_table :landslides do |t|
      t.string :country
      t.float :latitude
      t.float :longitude
      t.string :city
      t.text :description
      t.string :comment
      t.string :weather
      t.float :temp
      t.float :humidity
      t.timestamp :date

      t.timestamps null: false
    end
  end
end
