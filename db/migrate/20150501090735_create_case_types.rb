class CreateCaseTypes < ActiveRecord::Migration
  def change
    create_table :case_types do |t|
      t.string :name
      t.string :unit
      t.decimal :min_price

      t.timestamps null: false
    end
  end
end
