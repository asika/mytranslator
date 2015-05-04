class UserRemoveProfileid < ActiveRecord::Migration
  def change
    remove_column :users, :profile_id
  end
end
