class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  before_action :set_dog, only:[:show, :destroy]

  def index
    @dogs = Dog.all
    @dogs = policy_scope(Dog)
  end

  def show
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user ## use current_user like this ?
    authorize @dog
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
    authorize @dog
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :description) ## double check if user or user_id ?
  end

end

