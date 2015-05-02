class ProfileAddSummary < ActiveRecord::Migration
  def change
    add_column :profiles, :short_summary, :string
  end
end
