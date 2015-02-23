class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :genre
      t.int :year_birth

      t.timestamps
    end
  end
end
