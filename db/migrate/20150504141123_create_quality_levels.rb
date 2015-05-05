class CreateQualityLevels < ActiveRecord::Migration
  def change
    create_table :quality_levels do |t|
      t.integer :level
      t.string :name

      t.timestamps null: false
    end
  end
end
