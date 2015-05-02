class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username, :unique => true
      t.string :first_name
      t.string :last_name
      t.string :phone

      t.text :bio
      t.text :education
      t.text :professional
      t.text :experience
      t.text :certification
      t.text :account_info

      t.timestamps null: false
    end
  end
end
