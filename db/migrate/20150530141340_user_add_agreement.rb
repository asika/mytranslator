class UserAddAgreement < ActiveRecord::Migration
  def change
    add_column :users, :agreement, :boolean, :null => false, :default => false
  end
end
