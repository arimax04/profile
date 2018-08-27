class CreateCheckedUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :checked_users do |t|
      t.integer :checkedid

      t.timestamps
    end
  end
end
