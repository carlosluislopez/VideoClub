class UsersController < ApplicationController
  skip_before_filter :authenticate 

	def index
    @users = User.order(name: :asc)
  end

  def show
    @user = User.find(current_user.id)
    @streams = @user.streams
    #@streams = Stream.includes(:movie)

    if params[:keyword].present?
      q = params[:keyword]
      #@streams = @streams.joins(:movie).where("streams.id LIKE '%#{q}%' or movies.title '%#{q}%'")
      @streams = @streams.where("id like '%#{q}%'")

    else
      @streams = @user.streams
    end

    if request.xhr?
      #render json: { keyword: params[:keyword], action: "index" }.to_json, status: 200
      render partial: "table", locals: {streams:  @streams }
    end

  end

  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)

    if @user.save
      UserMailer.welcome_email(@user).deliver
      login(@user)
    else
      render :new
    end
  end

  def edit
     @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    
    if @user.update(user_params)
      redirect_to users_path,flash: {notice: "Usuario editado exitosamente"}
    else
      render :edit
    end
  end

	def streams_batch
    @user = User.find(current_user.id)
  end

  private
  def user_params
    params.require(:user).permit!
  end

end
