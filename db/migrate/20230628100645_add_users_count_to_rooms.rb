class AddUsersCountToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :users_count, :string, array: true, default: []
  end
end
