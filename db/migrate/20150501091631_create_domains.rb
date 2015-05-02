class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name, :index => true

      t.timestamps null: false
    end
  end
end
