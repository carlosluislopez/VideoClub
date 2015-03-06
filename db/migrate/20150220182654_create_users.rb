class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :genre
      t.integer  :year_birth

      t.timestamps
    end
  end
end
