class Rating < ActiveRecord::Base
  validates_inclusion_of :score, :in => 1..5

  belongs_to :case

  belongs_to :from, :class_name => "User", :foreign_key => "from"
  belongs_to :to, :class_name => "User", :foreign_key => "to"
end
