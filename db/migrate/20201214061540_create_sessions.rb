class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :title
      t.string :description
      t.belongs_to :user
      t.timestamps
    end
  end
end
