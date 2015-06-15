class ProfileAddSwitches < ActiveRecord::Migration
  def change
    add_column :profiles, :available, :boolean, :default => false
    add_column :profiles, :enable, :boolean, :default => true, :index => true
  end
end
