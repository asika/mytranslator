class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :profile_id, :null => false
      t.integer :test_source_id, :null => false
      t.datetime :submit_time
      t.text :answer
      t.integer :score
      t.text :comment

      t.timestamps null: false
    end

    add_column :pricings, :pass_test_id, :integer, :null => false
  end
end
