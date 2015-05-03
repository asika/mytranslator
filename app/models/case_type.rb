class CaseType < ActiveRecord::Base
  validates_presence_of :name, :unit, :min_price
end
