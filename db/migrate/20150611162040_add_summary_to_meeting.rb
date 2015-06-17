class AddSummaryToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :summary, :text
  end
end
