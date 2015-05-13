class RatingAddUnique < ActiveRecord::Migration
  def change
    add_index :ratings, [:case_id, :from, :to], :unique => true
  end
end
