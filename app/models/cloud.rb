class Cloud < ApplicationRecord
  belongs_to :user
#  geocoded_by :address
  before_validation :sanitize_picture_url, on: :create
  after_validation :geocode, if: :will_save_change_to_address?
  validates :description, length: { minimum: 220 }

  private

  def sanitize_picture_url
    self.picture_url ||= "https://i.ibb.co/6mHKxVW/default.png"
  end
end
