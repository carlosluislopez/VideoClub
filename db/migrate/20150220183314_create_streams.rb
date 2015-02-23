class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.decimal :amount

      t.timestamps
    end
  end
end
