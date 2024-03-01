class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def profile
    @user = current_user
    @clouds = current_user.clouds
    @bookings = current_user.bookings.where.not(status: 'rejected')
    @pending_bookings = Booking.joins(:cloud).where(clouds: { user_id: current_user.id }, status: :pending)
    @my_clouds = Cloud.where(user_id: current_user.id)
  end

end
