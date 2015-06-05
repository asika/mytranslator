class CaseType < ActiveRecord::Base
  validates_presence_of :from_language_id, :to_language_id, :unit, :min_price

  belongs_to :from_language, :class_name => 'Language', :foreign_key => :from_language_id
  belongs_to :to_language, :class_name => 'Language', :foreign_key => :to_language_id

  protected

  def name_i18n
    I18n.t("models.languages.#{self.from_language.name}")+"-->"+I18n.t("models.languages.#{self.to_language.name}")
  end
end
