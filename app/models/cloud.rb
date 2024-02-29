class Cloud < ApplicationRecord
  belongs_to :user
  after_create :sanitize_picture_url

  def sanitize_picture_url
    self.picture_url = "https://i.ibb.co/6mHKxVW/default.png" if self.picture_url.empty?
    self.save
  end
end
