class InvitationAddUnique < ActiveRecord::Migration
  def change
    add_index :invitations, [:case_id, :client_id, :translator_id], :unique => true
  end
end
