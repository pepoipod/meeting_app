require 'rails_helper'

RSpec.describe "meetings_topics/index", type: :view do
  before(:each) do
    assign(:meetings_topics, [
      MeetingsTopic.create!(
        :meeting_id => nil,
        :topic_id => nil
      ),
      MeetingsTopic.create!(
        :meeting_id => nil,
        :topic_id => nil
      )
    ])
  end

  it "renders a list of meetings_topics" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
