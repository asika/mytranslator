class UserBasicData < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, :null => false
    add_column :users, :first_name, :string, :null => false
    add_column :users, :last_name, :string, :null => false
    add_column :users, :phone, :string, :null => false

    remove_column :users, :friendly_id

    remove_column :profiles, :username, :string
    remove_column :profiles, :first_name, :string
    remove_column :profiles, :last_name, :string
    remove_column :profiles, :phone, :string

    add_index :users, :username, :unique => true
  end
end
