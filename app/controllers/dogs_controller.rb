class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  before_action :set_dog, only:[:show, :destroy, :edit]

  def index
    if params[:query].present?
      @dogs = Dog.search_by_size_and_breed(params[:query])
    else
      @dogs = Dog.all
    end
    @markers = @dogs.geocoded.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        infoWindow: render_to_string(partial: "/shared/info_window", locals: { dog: dog })
      }
    end
  end


  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user ## use current_user like this ?
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
  end

  def update
   @dog = Dog.find(params[:id])
   @dog.update(dog_params)
   redirect_to dog_path(@dog)
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path(@dog)
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :address, :size, :description, photos: []) ## double check if user or user_id ?
  end

end

