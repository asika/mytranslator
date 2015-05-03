class Case < ActiveRecord::Base
  validates_presence_of :client_id, :case_type_id, :word_count, :due, :valid_before, :quality_level

  belongs_to :client, :class_name => "User", :foreign_key => "client_id"
  belongs_to :translator, :class_name => "User", :foreign_key => "translator_id"

  has_one :case_type
  has_one :domain
end
