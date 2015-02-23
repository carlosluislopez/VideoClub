class AddMovieRefToStreams < ActiveRecord::Migration
  def change
    add_reference :streams, :movie, index: true
  end
end
