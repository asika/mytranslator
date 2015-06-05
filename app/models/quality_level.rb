class QualityLevel < ActiveRecord::Base
  validates_presence_of :name, :level

  def name_i18n
    I18n.t("models.quality_levels.#{self.name}")
  end
end
