class Domain < ActiveRecord::Base
  has_many :profile_domainships
  has_many :profiles, :through => :profile_domainships

  def name_i18n
    I18n.t(self.name)
  end
end
