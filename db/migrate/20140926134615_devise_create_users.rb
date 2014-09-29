class DeviseCreateUsers < ActiveRecord::Migration
  def up
    create_table(:users) do |t|

      ## Database authenticatable
      t.string :username,           null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      
      t.boolean :is_admin, null: false, default: false
      t.timestamps
    end

    add_index :users, :username,             unique: true
    add_index :users, :email,                unique: true
    add_index :users, :confirmation_token,   unique: true
    
  end

  def down
    remove_index :users, :username,             unique: true
    remove_index :users, :email,                unique: true
    remove_index :users, :confirmation_token,   unique: true

    drop_table :users
  end
end
