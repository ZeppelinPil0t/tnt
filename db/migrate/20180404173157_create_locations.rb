class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :location_name
      t.string :location_type
      t.integer :timezone
      t.integer :country_code

      t.timestamps
    end
  end
end
