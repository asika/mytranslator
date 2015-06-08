class PricingsRemovePassTest < ActiveRecord::Migration
  def change
    change_column :pricings, :pass_test_id, :integer
  end
end
