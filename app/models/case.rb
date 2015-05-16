class Case < ActiveRecord::Base
  validates_presence_of :client_id, :case_type_id, :word_count, :due, :quality_level_id
  validates :word_count, :numericality => {:only_integer => true, :greater_than => 0}

  validate :cannot_assign_to_self

  has_many :ratings, :dependent => :destroy
  has_many :invitations, :dependent => :destroy

  belongs_to :client, :class_name => "User", :foreign_key => "client_id"
  belongs_to :translator, :class_name => "User", :foreign_key => "translator_id"

  belongs_to :case_type
  belongs_to :domain
  belongs_to :quality_level

  def price_by_profile(profile)
    unit_price = profile.price_by_case(self)

    if unit_price
      (word_count.to_i * unit_price ).round
    else
      nil
    end
  end

  def invitation_sent? (kwargs)
    client = kwargs[:client]
    translator = kwargs[:translator]

    Invitation.exists?(:case_id => self.id, :client_id => client.id, :translator_id => translator.id)
  end

  def suggested_translators
    Profile.includes(:users).all
  end

  protected

  def cannot_assign_to_self
    errors.add(:client_id, 'You cannot assign a case to yourself.') if client_id == translator_id
  end

end