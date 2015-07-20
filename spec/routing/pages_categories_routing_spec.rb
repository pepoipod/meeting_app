require "rails_helper"

RSpec.describe PagesCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pages_categories").to route_to("pages_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/pages_categories/new").to route_to("pages_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/pages_categories/1").to route_to("pages_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pages_categories/1/edit").to route_to("pages_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pages_categories").to route_to("pages_categories#create")
    end

    it "routes to #update" do
      expect(:put => "/pages_categories/1").to route_to("pages_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pages_categories/1").to route_to("pages_categories#destroy", :id => "1")
    end

  end
end
