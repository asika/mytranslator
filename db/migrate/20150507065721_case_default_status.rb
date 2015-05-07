class CaseDefaultStatus < ActiveRecord::Migration
  def change
    change_column :cases, :status, :string, :default => "new", :index => true
  end
end
