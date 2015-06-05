class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, :null => false
      t.boolean :privileged, :null => false, :default => false

      t.timestamps null: false
    end
  end
end
