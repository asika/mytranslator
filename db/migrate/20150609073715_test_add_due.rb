class TestAddDue < ActiveRecord::Migration
  def change
    add_column :tests, :due, :datetime, :null => false
  end
end
