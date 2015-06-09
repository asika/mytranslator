class TestAddFriendlyId < ActiveRecord::Migration
  def change
    add_column :tests, :friendly_id, :string
  end
end
