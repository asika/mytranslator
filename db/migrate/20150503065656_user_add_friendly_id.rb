class UserAddFriendlyId < ActiveRecord::Migration
  def change
    add_column :users, :friendly_id, :string
  end
end
