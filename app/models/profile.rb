class Profile < ActiveRecord::Base
  belongs_to :user

  belongs_to :quality_level

  has_many :profile_domainships
  has_many :domains, :through => :profile_domainships

  has_many :profile_langships
  has_many :languages, :through => :profile_langships

  has_many :pricings, :dependent => :destroy

  accepts_nested_attributes_for :pricings
  validates_associated :pricings

  attr_reader :avatar_remote_url
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def price_by_case(c)
    self.pricings.where( :case_type_id => c.case_type_id ).first.try(:amount)
  end

  def avatar_remote_url=(url_value)
    self.avatar = URI.parse(url_value)
    # Assuming url_value is http://example.com/photos/face.png
    # avatar_file_name == "face.png"
    # avatar_content_type == "image/png"
    @avatar_remote_url = url_value
  end

end
