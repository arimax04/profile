class RemoveParenthomeFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :parenthome, :string
  end
end
