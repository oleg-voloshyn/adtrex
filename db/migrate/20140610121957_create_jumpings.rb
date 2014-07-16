class CreateJumpings < ActiveRecord::Migration
  def change
    create_table :jumpings do |t|
      t.integer :format
      t.string  :image
      t.string  :name
      t.string  :location
      t.integer :height
      t.string  :description

      t.timestamps
    end
  end
end
