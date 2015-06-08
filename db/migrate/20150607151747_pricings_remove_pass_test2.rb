class PricingsRemovePassTest2 < ActiveRecord::Migration
  def change
    change_column :pricings, :pass_test_id, :integer, :null => true
  end
end
