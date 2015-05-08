class Pricing < ActiveRecord::Base
  validates_presence_of :case_type, :amount

  belongs_to :profile
  belongs_to :case_type
end
