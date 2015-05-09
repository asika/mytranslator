class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username, :first_name, :last_name, :phone
  validates_uniqueness_of :username

  has_one :profile, :dependent => :destroy

  has_many :client_cases, :class_name => "Case"
  has_many :translator_cases, :class_name => "Case"

  def self.get_random_translators(number=10)
    # https://ihower.tw/rails4/activerecord-relationships.html#joins--includes-
    self.includes(:profile).order("RAND()").limit(number)
  end

  def to_param
    self.username
  end

  def is_client?
    self.profile.present? && self.profile.username && self.profile.first_name && self.profile.last_name && self.profile.phone
  end

  def is_translator?
    !profile.nil?
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

  def cases_new
    Case.where(:client => self, :status => "new")
  end

  def cases_ongoing
    Case.where(:client => self, :status => "ongoing")
  end

  def cases_finish
    Case.where(:client => self, :status => "finish")
  end

  def invitations
    Invitation.where("client_id = ? OR translator_id = ?", id, id)
  end

  def cases_other
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
