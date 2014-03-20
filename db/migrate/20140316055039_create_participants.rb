class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :country_code
      t.integer :microsite_id

      t.timestamps
    end
  end
end
