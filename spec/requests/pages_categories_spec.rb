require 'rails_helper'

RSpec.describe "PagesCategories", type: :request do
  describe "GET /pages_categories" do
    it "works! (now write some real specs)" do
      get pages_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
