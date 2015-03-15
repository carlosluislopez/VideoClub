class StreamsController < ApplicationController
  
  def index
    @movie = Movie.find(params[:movie_id])
    @streams = @movie.streams.order(created_at: :desc)
  end

  def new
    @user = User.find(params[:user_id])
    
    if current_user.id != @user.id
      redirect_to login_path
    end

    @stream = Stream.new
  end

  def create
    @user = User.find(params[:user_id])

    if current_user.id != @user.id
      redirect_to login_path
    end

    @stream = @user.streams.build(stream_params)

    if @stream.save
      UserMailer.confirm_stream(@stream).deliver
      redirect_to @user
    else
      render :new
    end
  end


  def destroy
    @user = User.find(params[:user_id])
    @stream = @user.stream.find(params[:id])

    @stream.destroy
    redirect_to @user, flash: {notice: "Stream Eliminada!"}
  end

  private

    def stream_params
      params.require(:stream).permit!
    end
end
