class PriceToDecimal < ActiveRecord::Migration
  def change
    change_column :case_types, :min_price, :decimal, :precision => 3, :scale => 1
    change_column :pricings, :amount, :decimal, :precision => 3, :scale => 1
  end
end
