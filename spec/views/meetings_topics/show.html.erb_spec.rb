require 'rails_helper'

RSpec.describe "meetings_topics/show", type: :view do
  before(:each) do
    @meetings_topic = assign(:meetings_topic, MeetingsTopic.create!(
      :meeting_id => nil,
      :topic_id => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
