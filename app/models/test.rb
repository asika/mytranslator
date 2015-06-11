class Test < ActiveRecord::Base
  before_create :update_due
  after_create :update_pricing
  after_update :update_pricing

  validates_presence_of :friendly_id
  validates_uniqueness_of :friendly_id

  before_validation :setup_friendly_id

  belongs_to :profile
  belongs_to :test_source

  def to_param
    self.friendly_id
  end

  def expire?
    self.due < Time.now
  end

  protected

  def update_due
    self.due = self.created_at + 2.hours
  end

  def update_pricing
    if self.score >= 60
      p = self.profile.pricings.build(
        :pass_test => self,
        :case_type => self.test_source.case_type
        )
      p.save!
    end
  end

  def setup_friendly_id
    if self.friendly_id.blank?
     self.friendly_id = SecureRandom.hex(16)
     self.save!
    end
  end
end
