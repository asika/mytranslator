class CaseAddAttachment < ActiveRecord::Migration
  def change
    add_attachment :cases, :attachment
  end
end
