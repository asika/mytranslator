class Case < ActiveRecord::Base
  validates_presence_of :client_id, :case_type_id, :word_count, :due, :valid_before, :quality_level_id

  belongs_to :client, :class_name => "User", :foreign_key => "client_id"
  belongs_to :translator, :class_name => "User", :foreign_key => "translator_id"

  belongs_to :case_type
  belongs_to :domain
  belongs_to :quality_level
end
