class StreamsController < ApplicationController
	def new
    @user = User.find(params[:user_id])
    @stream = Stream.new
  end

  def create
    @user = User.find(params[:user_id])

    @stream = @user.streams.build(stream_params)

    if @stream.save
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
