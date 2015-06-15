class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username, :first_name, :last_name, :phone
  validates_uniqueness_of :username

  belongs_to :role

  has_one :profile, :dependent => :destroy

  has_many :sent_ratings, :class_name => "Rating", :foreign_key => "from"
  has_many :received_ratings, :class_name => "Rating", :foreign_key => "to"

  has_many :client_cases, :class_name => "Case", :foreign_key => "client_id", :dependent => :destroy
  has_many :translator_cases, :class_name => "Case", :foreign_key => "translator_id", :dependent => :destroy

  # TODO: customize max number of invitees
  MAX_INVITATION = 1

  def self.get_random_translators(number=10)
    # https://ihower.tw/rails4/activerecord-relationships.html#joins--includes-
    self.joins(:profile).includes(:profile).order("RAND()").limit(number)
  end

  def to_param
    self.username
  end

  def is_client?
    self.profile.present? && self.profile.username && self.profile.first_name && self.profile.last_name && self.profile.phone
  end

  def is_translator?
    profile.present?
  end

  def is_admin?
    false
  end

  def has_invited?(case_id, translator_id)
    Invitation.exists?(:case_id => case_id, :client_id => self.id, :translator_id => translator_id)
  end

  def can_invite?(case_id)
    !Invitation.exists?(:case_id => case_id, :client_id => self.id)
  end

  def invitations_left(case_id)
    MAX_INVITATION - Invitation.where("client_id = #{id} AND status = 'new'").count
  end

  def cases_new
    Case.where(:client => self, :status => "new")
  end

  def cases_ongoing
    # Case.where(:client => self, :status => "ongoing")
    Case.where(:client => self, :status => ['new', 'matching', 'ongoing'])
  end

  def cases_finish
    Case.where(:client => self, :status => "finish")
  end

  def invitations
    Invitation.where("client_id = ? OR translator_id = ?", id, id)
  end

  def cases_other
    Case.where(:client => self, :status.not => ['new', 'matching', 'ongoing', 'finish'])
  end

  def average_rating
    received_ratings.average(:score).try(:round) || 0

    #ratings = received_ratings.pluck(:score)
    #if ratings.size > 0
    #  (ratings.sum.to_f / ratings.size).round
    #else
    #  0
    #end
  end

  def full_name
    if self.profile && self.profile.nickname
      self.profile.nickname
    else
      "#{first_name} #{last_name}"
    end
  end
end
