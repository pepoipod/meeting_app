require 'rails_helper'

RSpec.describe "MeetingsTopics", type: :request do
  describe "GET /meetings_topics" do
    it "works! (now write some real specs)" do
      get meetings_topics_path
      expect(response).to have_http_status(200)
    end
  end
end
