class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :friendly_id
  validates_uniqueness_of :friendly_id

  before_validation :setup_friendly_id

  has_one :profile, :dependent => :destroy

  has_many :client_cases, :class_name => "Case"
  has_many :translator_cases, :class_name => "Case"

  has_many :invitations
  # has_many :invitors, :through => :invitations
  # has_many :invited_users, :through => :invitations

  def to_param
    self.friendly_id
  end

  def is_client?
    self.profile.present? && self.profile.username && self.profile.first_name && self.profile.last_name && self.profile.phone
  end

  def is_translator?
    true
  end

  def is_admin?
    false
  end

  def has_invited?(case_id, translator_id)
    Invitation.exists?(:case_id => case_id, :client_id => self.id, :translator_id => translator_id)
  end

  def can_invite?(case_id)
    # TODO: customize max number of invitees
    !Invitation.exists?(:case_id => case_id, :client_id => self.id)
  end

  def setup_friendly_id
    if self.friendly_id.blank?
     self.friendly_id = Digest::MD5.hexdigest(self.email)
     self.save!
    end
  end

end
