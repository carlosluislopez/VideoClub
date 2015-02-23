class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.boolean :avaible
      t.datetime :released_at

      t.timestamps
    end
  end
end
