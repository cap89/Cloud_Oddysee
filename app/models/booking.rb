class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cloud

  validates :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date, message: "must be later"  }
  validate :start_date_greater_than_available_from
  validate :end_date_less_than_available_until

  #equals greater
  #no error messages

  def start_date_greater_than_available_from
    if start_date < cloud.available_from
      errors.add(:start_date, "must be after the cloud is available")
    end
  end

  def end_date_less_than_available_until
    if end_date > cloud.available_until
      errors.add(:end_date, "must be before the cloud is available")
    end
  end

end
