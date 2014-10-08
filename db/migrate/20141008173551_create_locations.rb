class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :latitude
      t.string :longitude
      t.references :locationable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
