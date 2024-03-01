class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy, :accept, :reject]

  def new
    @booking = Booking.new
    @cloud = Cloud.find(params[:cloud_id])
  end

  def edit
  end

  def create

    @booking = Booking.new(booking_params)
    @cloud = Cloud.find(params[:cloud_id])
    @booking.user = current_user
    @booking.cloud = @cloud
    if @booking.save!
    redirect_to profile_path, notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'Booking was not created. Please try again.'
    end
  end

  def update
    @booking.update(booking_params)
    @booking.save
    redirect_to booking_path(@booking.id)
  end

  def destroy
    @booking.destroy
    redirect_to profile_path
  end

  def accept
    @booking.update!(status: :accepted)
    redirect_to profile_path, notice: 'Booking accepted.'
  end

  def reject
    @booking.update!(status: :rejected)
    redirect_to profile_path, notice: 'Booking rejected.'
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :cloud_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
