class CreateJumpings < ActiveRecord::Migration
  def change
    create_table :jumpings do |t|
      t.string  :type
      t.string  :name
      t.integer :height
      t.integer :free_height

      t.timestamps
    end
  end
end
