class UserAddDomain < ActiveRecord::Migration
  def change
    add_column :users, :domain, :text, :index => true
  end
end
