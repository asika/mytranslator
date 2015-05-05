class CaseQualityLevel < ActiveRecord::Migration
  def change
    rename_column :cases, :quality_level, :quality_level_id
  end
end
