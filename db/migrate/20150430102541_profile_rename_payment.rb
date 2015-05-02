class ProfileRenamePayment < ActiveRecord::Migration
  def change
    rename_column :profiles, :account_info, :payment_info
  end
end
