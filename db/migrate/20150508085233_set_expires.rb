class SetExpires < ActiveRecord::Migration
  def change
    remove_column :cases, :valid_before
    rename_column :invitations, :valid_before, :expire
  end
end
