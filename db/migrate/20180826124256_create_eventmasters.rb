class CreateEventmasters < ActiveRecord::Migration[5.2]
  def change
    create_table :eventmasters do |t|
      t.string :kindofevent
      t.time :date
      t.string :place
      t.text :participants
      t.text :supplement

      t.timestamps
    end
  end
end
