require 'rails_helper'

RSpec.describe "meetings_topics/new", type: :view do
  before(:each) do
    assign(:meetings_topic, MeetingsTopic.new(
      :meeting_id => nil,
      :topic_id => nil
    ))
  end

  it "renders new meetings_topic form" do
    render

    assert_select "form[action=?][method=?]", meetings_topics_path, "post" do

      assert_select "input#meetings_topic_meeting_id_id[name=?]", "meetings_topic[meeting_id_id]"

      assert_select "input#meetings_topic_topic_id_id[name=?]", "meetings_topic[topic_id_id]"
    end
  end
end
