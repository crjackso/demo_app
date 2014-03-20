class CreateMicrosites < ActiveRecord::Migration
  def change
    create_table :microsites do |t|
      t.string :name

      t.timestamps
    end
  end
end
