class Pricing < ActiveRecord::Base
  before_validation :check_amount, :on => :create
  validates_presence_of :case_type, :amount

  belongs_to :profile
  belongs_to :case_type
  belongs_to :pass_test, :class_name => 'Test', :foreign_key => :pass_test_id

  protected

  def check_amount
    if self.amount.nil?
      self.amount = self.case_type.min_price
    end
  end
end
