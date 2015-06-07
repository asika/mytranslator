class CreateTestSources < ActiveRecord::Migration
  def change
    create_table :test_sources do |t|
      t.integer :language_id, :null => false
      t.attachment :source, :null => false

      t.timestamps null: false
    end
  end
end
