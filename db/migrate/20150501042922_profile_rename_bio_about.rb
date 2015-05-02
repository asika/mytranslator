class ProfileRenameBioAbout < ActiveRecord::Migration
  def change
    rename_column :profiles, :bio, :about
  end
end
