class Domain < ActiveRecord::Base
  validates_presence_of :name

  has_many :profile_domainships
  has_many :profiles, :through => :profile_domainships

  def name_i18n
    I18n.t("models.domains.#{self.name}")
  end
end
