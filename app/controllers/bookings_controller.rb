class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @cloud = Cloud.find(params[:cloud_id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @cloud = Cloud.find(params[:cloud_id])
    @booking.user = current_user
    @booking.cloud = @cloud
    if @booking.save
    redirect_to cloud_path(@cloud), notice: 'Booking was successfully created.'
    else
      render :new, notice: 'Booking was not created. Please try again.'
    end
  end

# can be done at a later stage
  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @booking.save
    redirect_to booking_path(@booking.id)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :cloud_id)
  end
end
