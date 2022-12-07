class RemoveStringFromCityWeathers < ActiveRecord::Migration[7.0]
  def change
    remove_column :city_weathers, :string, :string
  end
end
