class Role < ActiveRecord::Base
  def self.unprivileged
    self.where(:privileged => false).all
  end

  def name_i18n
    I18n.t("models.roles.#{self.name}")
  end
end
