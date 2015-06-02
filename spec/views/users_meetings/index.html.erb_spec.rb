require 'rails_helper'

RSpec.describe "users_meetings/index", type: :view do
  before(:each) do
    assign(:users_meetings, [
      UsersMeeting.create!(
        :user_id => nil,
        :meeting_id => nil
      ),
      UsersMeeting.create!(
        :user_id => nil,
        :meeting_id => nil
      )
    ])
  end

  it "renders a list of users_meetings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
