class TestsourceChangeLanguageToCasetype < ActiveRecord::Migration
  def change
    rename_column :test_sources, :language_id, :case_type_id
  end
end
