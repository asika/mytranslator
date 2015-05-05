class Pricing < ActiveRecord::Base
  belongs_to :profile
  belongs_to :case_type
end
