class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.string :univ
      t.string :station
      t.string :phone
      t.string :highschool
      t.string :university
      t.text :supplement, :limit => 4294967295 

      t.timestamps
    end
  end
end
