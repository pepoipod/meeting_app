require "rails_helper"

RSpec.describe UsersMeetingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/users_meetings").to route_to("users_meetings#index")
    end

    it "routes to #new" do
      expect(:get => "/users_meetings/new").to route_to("users_meetings#new")
    end

    it "routes to #show" do
      expect(:get => "/users_meetings/1").to route_to("users_meetings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/users_meetings/1/edit").to route_to("users_meetings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/users_meetings").to route_to("users_meetings#create")
    end

    it "routes to #update" do
      expect(:put => "/users_meetings/1").to route_to("users_meetings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users_meetings/1").to route_to("users_meetings#destroy", :id => "1")
    end

  end
end
