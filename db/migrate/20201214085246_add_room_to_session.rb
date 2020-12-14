class AddRoomToSession < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :unique_room, :string
    add_column :sessions, :unique_password, :string
  end
end
