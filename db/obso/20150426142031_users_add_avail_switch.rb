class UsersAddAvailSwitch < ActiveRecord::Migration
  def change
    add_column :users, :is_available, :bool, :default => true
  end
end
