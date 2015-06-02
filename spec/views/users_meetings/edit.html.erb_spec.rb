require 'rails_helper'

RSpec.describe "users_meetings/edit", type: :view do
  before(:each) do
    @users_meeting = assign(:users_meeting, UsersMeeting.create!(
      :user_id => nil,
      :meeting_id => nil
    ))
  end

  it "renders the edit users_meeting form" do
    render

    assert_select "form[action=?][method=?]", users_meeting_path(@users_meeting), "post" do

      assert_select "input#users_meeting_user_id_id[name=?]", "users_meeting[user_id_id]"

      assert_select "input#users_meeting_meeting_id_id[name=?]", "users_meeting[meeting_id_id]"
    end
  end
end
