class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :start_datetime
      t.boolean :finished_flg

      t.timestamps null: false
    end
  end
end
