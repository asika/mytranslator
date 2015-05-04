class Pricing < ActiveRecord::Base
  belongs_to :profile

  has_one :case_type
end
