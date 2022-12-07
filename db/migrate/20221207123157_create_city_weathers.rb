class CreateCityWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :city_weathers do |t|
      t.string :country
      t.string :string
      t.string :name
      t.integer :temperature
      t.text :weather_description
      t.integer :wind_speed
      t.integer :wind_degree

      t.timestamps
    end
  end
end
