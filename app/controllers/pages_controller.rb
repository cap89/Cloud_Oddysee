class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def profile
    @user = current_user
    @bookings = Booking.where(user_id: current_user.id)
    @pending_bookings = Booking.joins(:cloud).where(clouds: { user_id: current_user.id }, status: :pending)
  end

end
