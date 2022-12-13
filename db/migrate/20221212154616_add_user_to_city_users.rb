class AddUserToCityUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :city_users, :user, null: false, foreign_key: true
  end
end
