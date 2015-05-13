class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :case_id, :null => false, :index => true
      t.integer :score, :null => false
      t.integer :from, :null => false, :index => true
      t.integer :to, :null => false, :index => true
      t.text :comment

      t.timestamps null: false
    end
  end
end
