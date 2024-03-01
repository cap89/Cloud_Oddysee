class Cloud < ApplicationRecord
  belongs_to :user
#  geocoded_by :address
  after_create :sanitize_picture_url
#  after_validation :geocode, if: :will_save_change_to_address?
  validates :description, length: { minimum: 220 }

  def sanitize_picture_url
    self.picture_url = "https://i.ibb.co/6mHKxVW/default.png" if self.picture_url.empty?
    self.save
  end
end
