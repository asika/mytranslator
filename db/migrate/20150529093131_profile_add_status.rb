class ProfileAddStatus < ActiveRecord::Migration
  def change
    add_column :profiles, :status, :string, :null => false, :default => 'unverified'
  end
end
