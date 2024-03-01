class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cloud

  validates :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date, message: "must be later"  }
  # validate :start_date_greater_than_available_from
  # validate :end_date_less_than_available_until
  validate :cannot_book_own_cloud

  private

  def start_date_greater_than_available_from
    # Check if start_date is before the cloud's available_from date
    if cloud.available_from < start_date
      errors.add(:start_date, "must be after the cloud is available from date")
    end
  end

  def end_date_less_than_available_until
    # Check if end_date is after the cloud's available_until date
    if cloud.available_until < end_date
      errors.add(:end_date, "must be before the cloud is available until date")
    end
  end

  after_initialize :set_default_status, if: :new_record?
  enum status: { pending: 'pending', accepted: 'accepted', rejected: 'rejected' }


  def set_default_status
    self.status ||= "pending"
  end

  def cannot_book_own_cloud
    if user == cloud.user
      errors.add(:user, "cannot book your own cloud")
    end
  end


end
