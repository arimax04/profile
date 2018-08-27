class AddColumnProvinceToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :province, :string
  end
end
