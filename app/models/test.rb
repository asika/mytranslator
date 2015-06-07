class Test < ActiveRecord::Base
  after_update :update_pricing

  belongs_to :profile
  belongs_to :test_source

  protected

  def update_pricing
    if self.score >= 60
      p = self.profile.pricings.build(
        :pass_test => self,
        :case_type => self.test_source.case_type
        )
      p.save!
    end
  end
end
