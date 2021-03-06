class BookingsController < ApplicationController
  before_action :set_dog, only:[:new, :create]

  def index
    @owner_bookings = current_user.owner_bookings
    # @owner_bookings_pending = []
    # @owner_bookings_accepted = []
    # @owner_bookings_declined = []
    # owner_bookings.each do |booking|
    #   case booking.status
    #   when nil
    #     @owner_bookings_pending << booking
    #   when true
    #     @owner_bookings_accepted << booking
    #   when false
    #     @owner_bookings_declined << booking
    #   end
    # end
    @renter_bookings = current_user.renter_bookings
    @dogs = Dog.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dog = @dog
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def accept
    booking = Booking.find(params[:id])
    booking.status = true
    booking.save
    redirect_to bookings_path
  end

  def reject
    booking = Booking.find(params[:id])
    booking.status = false
    booking.save
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @dog = @booking.dog
    @booking.destroy
    redirect_to dog_path(@dog)
  end

  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def booking_params
    params.require(:booking).permit(:description) ## user_id/dog_id or user/dog ?
  end
end
