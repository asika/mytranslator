class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :friendly_id
  validates_uniqueness_of :friendly_id

  before_validation :setup_friendly_id

  has_one :profile, :dependent => :destroy

  def to_param
    self.friendly_id
  end

  def admin?
    false
  end

  def setup_friendly_id
    if self.friendly_id.blank?
     self.friendly_id = SecureRandom.hex(8)
     self.save!
    end
  end

end
