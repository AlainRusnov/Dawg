class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  before_action :set_dog, only:[:show, :destroy]

  def index
  @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
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
    params.require(:dog).permit(:name, :breed, :description, :user_id)
  end

end

