class ProfileAddSample < ActiveRecord::Migration
  def change
    add_attachment :profiles, :sample
  end
end
