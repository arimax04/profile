class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.integer :newcomer_id
      t.integer :event_id

      t.timestamps
    end
  end
end
