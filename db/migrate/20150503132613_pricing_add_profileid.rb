class PricingAddProfileid < ActiveRecord::Migration
  def change
    add_column :pricings, :profile_id, :integer
    rename_column :pricings, :category_id, :case_type_id
  end
end
