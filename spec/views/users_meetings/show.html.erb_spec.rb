require 'rails_helper'

RSpec.describe "users_meetings/show", type: :view do
  before(:each) do
    @users_meeting = assign(:users_meeting, UsersMeeting.create!(
      :user_id => nil,
      :meeting_id => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
