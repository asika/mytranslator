class Invitation < ActiveRecord::Base
  belongs_to :client, :class => "User", :foreign_key => "client_id"
  belongs_to :translator, :class => "User", :foreign_key => "translator_id"
end
