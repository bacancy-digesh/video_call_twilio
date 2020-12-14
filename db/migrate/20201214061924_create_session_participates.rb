class CreateSessionParticipates < ActiveRecord::Migration[6.0]
  def change
    create_table :session_participates do |t|
      t.belongs_to :user
      t.belongs_to :session
      t.timestamps
    end
  end
end
