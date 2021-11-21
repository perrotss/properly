class RemoveBuildingAgeFromProperties < ActiveRecord::Migration[6.0]
  def change
    remove_column :properties, :building_age, :integer
  end
end
