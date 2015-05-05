class CreateProfileLangships < ActiveRecord::Migration
  def change
    create_table :profile_langships do |t|
      t.integer :profile_id
      t.integer :language_id

      t.timestamps null: false
    end
  end
end
