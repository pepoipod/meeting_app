class CreateMeetingsTopics < ActiveRecord::Migration
  def change
    create_table :meetings_topics do |t|
      t.references :meeting_id, index: true, foreign_key: true
      t.references :topic_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
