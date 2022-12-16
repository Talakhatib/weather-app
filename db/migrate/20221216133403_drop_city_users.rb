class DropCityUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :city_users
  end
end
