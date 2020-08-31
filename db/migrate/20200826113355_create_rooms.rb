class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.belongs_to :user
      t.string :sid
      t.string :name
      t.string :token

      t.timestamps
    end
  end
end
