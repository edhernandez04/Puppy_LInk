class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_breeds = @user.pets.select{|pet| pet.breed}
    @suggested_dogs = Pet.all.select{|dg| dg.breed == @user_breeds} 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save(user_params)
      flash[:messages] = "New User Added"
      redirect_to user_path(@user)
    else 
      flash[:messages] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :age)
  end
end
