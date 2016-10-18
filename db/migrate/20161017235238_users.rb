class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :phone, null: false
      t.string :account_number, null: false
      t.string :expiry, null: false
      t.string :cvv, null: false
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
