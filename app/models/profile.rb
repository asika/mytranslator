class Profile < ActiveRecord::Base
  validates_presence_of :username, :first_name, :last_name, :phone, :payment_info
  validates_uniqueness_of :username

  belongs_to :user

  has_many :profile_domainships
  has_many :domains, :through => :profile_domainships

  has_many :profile_langships
  has_many :languages, :through => :profile_langships

  has_many :pricings, :dependent => :destroy

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def full_name
    "#{first_name} #{last_name}"
  end
end
