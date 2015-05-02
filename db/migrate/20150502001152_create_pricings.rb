class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.integer :category_id
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
