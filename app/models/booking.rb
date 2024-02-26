class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cloud
end
