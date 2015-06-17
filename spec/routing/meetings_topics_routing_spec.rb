require "rails_helper"

RSpec.describe MeetingsTopicsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/meetings_topics").to route_to("meetings_topics#index")
    end

    it "routes to #new" do
      expect(:get => "/meetings_topics/new").to route_to("meetings_topics#new")
    end

    it "routes to #show" do
      expect(:get => "/meetings_topics/1").to route_to("meetings_topics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/meetings_topics/1/edit").to route_to("meetings_topics#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/meetings_topics").to route_to("meetings_topics#create")
    end

    it "routes to #update" do
      expect(:put => "/meetings_topics/1").to route_to("meetings_topics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/meetings_topics/1").to route_to("meetings_topics#destroy", :id => "1")
    end

  end
end
