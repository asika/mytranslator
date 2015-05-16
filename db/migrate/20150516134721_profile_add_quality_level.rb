class ProfileAddQualityLevel < ActiveRecord::Migration
  def change
    add_column :profiles, :quality_level_id, :integer
  end
end
