class ProfileLangship < ActiveRecord::Base
  belongs_to :profile
  belongs_to :language
end
