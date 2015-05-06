class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :client_id, :index => true
      t.integer :translator_id, :index => true

      t.datetime :valid_before
      t.string :status

      t.timestamps null: false
    end
  end
end
