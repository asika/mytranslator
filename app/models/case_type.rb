class CaseType < ActiveRecord::Base
  validates_presence_of :name, :unit, :min_price

  def name_i18n
    I18n.t(self.name)
  end
end
