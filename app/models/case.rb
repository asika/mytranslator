class Case < ActiveRecord::Base
  validates_presence_of :client_id, :case_type_id, :word_count, :due, :quality_level_id
  validates :word_count, :numericality => {:only_integer => true, :greater_than => 0}

  belongs_to :client, :class_name => "User", :foreign_key => "client_id"
  belongs_to :translator, :class_name => "User", :foreign_key => "translator_id"

  belongs_to :case_type
  belongs_to :domain
  belongs_to :quality_level

  def price_by_profile(profile)
    word_count * Pricing.where("profile_id = #{profile.id} AND case_type_id = #{case_type_id}").first.amount
  end

  def invitation_sent? (kwargs)
    client = kwargs[:client]
    translator = kwargs[:translator]

    Invitation.exists?(:case_id => self.id, :client_id => client.id, :translator_id => translator.id)
  end

end