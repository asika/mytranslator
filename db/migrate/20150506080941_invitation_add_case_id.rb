class InvitationAddCaseId < ActiveRecord::Migration
  def change
    add_column :invitations, :case_id, :integer, :index => true
  end
end
