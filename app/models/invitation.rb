class Invitation < ActiveRecord::Base
  validates_presence_of :client_id, :translator_id, :expire

  belongs_to :case
  belongs_to :client, :class_name => "User", :foreign_key => "client_id"
  belongs_to :translator, :class_name => "User", :foreign_key => "translator_id"
end
