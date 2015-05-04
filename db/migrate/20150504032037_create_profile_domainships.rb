class CreateProfileDomainships < ActiveRecord::Migration
  def change
    create_table :profile_domainships do |t|
      t.integer :profile_id, :index => true
      t.integer :domain_id, :index => true

      t.timestamps null: false
    end
  end
end
