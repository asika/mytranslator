class QualityLevel < ActiveRecord::Base
  def name_i18n
    I18n.t(self.name)
  end
end
