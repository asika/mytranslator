class UserAddRole < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer, :null => false
  end
end
