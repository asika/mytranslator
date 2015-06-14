class Language < ActiveRecord::Base
  validates_presence_of :name

  has_many :profile_langships
  has_many :profiles, :through => :profile_langships

  def name_i18n
    I18n.t("models.languages.#{self.name}")
  end
end
