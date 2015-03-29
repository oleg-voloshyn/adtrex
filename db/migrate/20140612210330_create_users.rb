class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :login, unique: true
      t.string  :email, unique: true, index: true
      t.string  :password_digest
      t.string  :token, index: true
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
