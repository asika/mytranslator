class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :client_id
      t.integer :translator_id
      t.integer :case_type_id
      t.integer :domain_id
      t.integer :word_count
      t.decimal :price
      t.datetime :due
      t.datetime :valid_before
      t.integer :quality_level

      t.string :friendly_id
      t.string :status

      t.timestamps null: false
    end
  end
end
