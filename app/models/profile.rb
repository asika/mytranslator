class Profile < ActiveRecord::Base
  validates_presence_of :username, :first_name, :last_name, :phone, :account_info
  validates_uniqueness_of :username

  belongs_to :user

  has_many :domains
  has_many :pricings

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
