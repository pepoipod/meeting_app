class AddTitleToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :title, :string
  end
end
