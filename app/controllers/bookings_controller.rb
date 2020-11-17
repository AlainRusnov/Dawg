class BookingsController < ApplicationController
  before_action :set_dog, only:[:new, :create]

  def show
    @bookings = User.bookings.all ## NEED TO SUS THIS OUT
    ## NO INDEX PAGE FOR ALL BOOKINGS ONLY SHOW
    ##
  end

  def new
    @booking = Booking.new
    @booking.user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dog = @dog ## works ??
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
    params.require(:booking).permit(:description, :status, :user_id, :dog_id) ## user_id/dog_id or user/dog ?
  end
end

