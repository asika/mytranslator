class TestSource < ActiveRecord::Base
  belongs_to :case_type

  attr_reader :source_remote_url
  has_attached_file :source
  validates_attachment_content_type :source, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']

  def source_remote_url=(url_value)
    self.source = URI.parse(url_value)
    @source_remote_url = url_value
  end
end
