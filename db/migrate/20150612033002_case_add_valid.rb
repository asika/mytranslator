class CaseAddValid < ActiveRecord::Migration
  def change
    add_column :cases, :confirmed, :boolean, :null => false, :default => false, :index => true
  end
end
