class ProfileDomainship < ActiveRecord::Base
  belongs_to :profile
  belongs_to :domain
end
