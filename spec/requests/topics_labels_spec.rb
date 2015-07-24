require 'rails_helper'

RSpec.describe "TopicsLabels", type: :request do
  describe "GET /topics_labels" do
    it "works! (now write some real specs)" do
      get topics_labels_path
      expect(response).to have_http_status(200)
    end
  end
end
