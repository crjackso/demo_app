class AddIndexToParticipantsEmail < ActiveRecord::Migration
  def change
    add_index :participants, [:email, :microsite_id], unique: true
  end
end
