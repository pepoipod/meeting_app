require 'rails_helper'

RSpec.describe "UsersMeetings", type: :request do
  describe "GET /users_meetings" do
    it "works! (now write some real specs)" do
      get users_meetings_path
      expect(response).to have_http_status(200)
    end
  end
end
