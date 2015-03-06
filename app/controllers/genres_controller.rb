class GenresController < ApplicationController

	def index
    @genres = Genre.order(title: :asc)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to genres_path,
      	flash: {notice: "Genero creado exitosamente"}
    else
      render :new
    end
  end

  def update
    @genre = Genre.find(params[:id])

    if @user.update(genre_params)
      redirect_to genres_path,
      	flash: {notice: "Genero editado exitosamente"}
    else
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit!
  end
end
