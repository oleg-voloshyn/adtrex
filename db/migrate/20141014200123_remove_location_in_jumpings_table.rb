class RemoveLocationInJumpingsTable < ActiveRecord::Migration
  def change
    remove_column :jumpings, :location
  end
end
