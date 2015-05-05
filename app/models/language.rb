class Language < ActiveRecord::Base
  has_many :profile_langships
  has_many :profiles, :through => :profile_langships

  def name_i18n
    I18n.t(self.name)
  end
end
