class Invitation < ActiveRecord::Base
  belongs_to :case
  belongs_to :client, :class => "User", :foreign_key => "client_id"
  belongs_to :translator, :class => "User", :foreign_key => "translator_id"

  # after_initialize: the very first hook
  # after_initialize :generate_track_code, if: :new_record?

  def generate_track_code
    self.track_code = SecureRandom.hex(12)
  end

end
