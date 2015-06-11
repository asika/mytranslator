class PricingAddCertified < ActiveRecord::Migration
  def change
    add_column :pricings, :certified, :boolean, :null => false, :default => false
    add_column :pricings, :admin_invited, :boolean, :null => false, :default => false
  end
end
