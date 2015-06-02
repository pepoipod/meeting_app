class CreateUsersMeetings < ActiveRecord::Migration
  def change
    create_table :users_meetings do |t|
      t.references :user_id, index: true, foreign_key: true
      t.references :meeting_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
