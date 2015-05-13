class Profile < ActiveRecord::Base

  belongs_to :user

  has_many :profile_domainships
  has_many :domains, :through => :profile_domainships

  has_many :profile_langships
  has_many :languages, :through => :profile_langships

  has_many :pricings, :dependent => :destroy

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/, :size => { :in => 0..1.megabytes }

  has_attached_file :sample
  validates_attachment_content_type :sample, :content_type => /.*/, 
  									:size => { :in => 0..10.megabytes }


end
