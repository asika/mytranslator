class CasetypeGeneralize < ActiveRecord::Migration
  def change
    add_column :case_types, :from_language_id, :integer, :null => false
    add_column :case_types, :to_language_id, :integer, :null => false
  end
end
