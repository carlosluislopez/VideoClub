class ChangeAvaibleToAvailable < ActiveRecord::Migration
  def change
  	rename_column :movies, :avaible, :available
  end
end
