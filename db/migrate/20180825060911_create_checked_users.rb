class CreateCheckedUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :checked_users do |t|
      t.integer :profile_id

      t.timestamps
    end
  end
end
