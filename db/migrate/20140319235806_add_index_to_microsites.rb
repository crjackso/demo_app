class AddIndexToMicrosites < ActiveRecord::Migration
  def change
    add_index :microsites, :name, unique: true
  end
end
