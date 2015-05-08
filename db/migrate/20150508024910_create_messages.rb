class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :from, :null => false, :index => true
      t.integer :to, :null => false, :index => true
      t.text :content, :null => false

      t.timestamps null: false
    end

  end
end
