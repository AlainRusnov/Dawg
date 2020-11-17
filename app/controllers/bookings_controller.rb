class BookingsController < ApplicationController
  before_action :set_dog, only:[:new, :create]

  def show
    @bookings = User.bookings.all ## NEED TO SUS THIS OUT
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(booking_params)
    @booking.dog = @dog
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
    redirect_to cocktail_path(@dog)
  end

  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def booking_params
    params.require(:booking).permit(:description, :status, :user_id, :dog_id)
  end
end

end
