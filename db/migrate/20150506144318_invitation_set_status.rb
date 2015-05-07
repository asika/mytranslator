class InvitationSetStatus < ActiveRecord::Migration
  def change
    change_column :invitations, :status, :string, :default => "new", :index => true
  end
end
