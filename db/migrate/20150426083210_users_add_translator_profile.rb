class UsersAddTranslatorProfile < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, :index => true
    add_column :users, :first_name, :string, :index => true
    add_column :users, :last_name, :string, :index => true

    add_attachment :users, :avatar

    add_column :users, :bio, :text
    add_column :users, :education, :text
    add_column :users, :experience, :text
    add_column :users, :career, :text
    add_column :users, :certification, :text
  end
end
