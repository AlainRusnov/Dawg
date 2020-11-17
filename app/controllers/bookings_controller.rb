class BookingsController < ApplicationController
  before_action :set_dog, only:[:new, :create]

  def index
    @owner_bookings = current_user.owner_bookings
    @renter_bookings = current_user.renter_bookings
    ##
  end

  def new
    @booking = Booking.new
    @booking = policy_scope(Booking)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dog = @dog
    authorize @booking
    if @booking.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
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

