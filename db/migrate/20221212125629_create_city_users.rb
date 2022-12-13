class CreateCityUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :city_users do |t|
      t.string :his_city
      t.timestamps
    end
  end
end
