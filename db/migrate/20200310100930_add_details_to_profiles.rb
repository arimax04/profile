class AddDetailsToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :beginner, :string
    add_column :profiles, :email, :string
    add_column :profiles, :line, :string
    add_column :profiles, :solicitater, :string
  end
end
