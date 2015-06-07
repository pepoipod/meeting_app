class AddAttendanceFlgToUsersMeeting < ActiveRecord::Migration
  def change
    add_column :users_meetings, :attendance_flg, :boolean
  end
end
