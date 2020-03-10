class AddOthersToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :solicitationplace, :string
    add_column :profiles, :personality, :string
    add_column :profiles, :parenthome, :string
    add_column :profiles, :club, :string
    add_column :profiles, :recommendation, :string
    add_column :profiles, :interest, :string
  end
end
