class UserController < ApplicationController

	def index
    @users = User.order(name: :asc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :streams_batch
    end
  end

	def streams_batch
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit!
  end

end
