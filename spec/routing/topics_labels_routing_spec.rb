require "rails_helper"

RSpec.describe TopicsLabelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/topics_labels").to route_to("topics_labels#index")
    end

    it "routes to #new" do
      expect(:get => "/topics_labels/new").to route_to("topics_labels#new")
    end

    it "routes to #show" do
      expect(:get => "/topics_labels/1").to route_to("topics_labels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/topics_labels/1/edit").to route_to("topics_labels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/topics_labels").to route_to("topics_labels#create")
    end

    it "routes to #update" do
      expect(:put => "/topics_labels/1").to route_to("topics_labels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/topics_labels/1").to route_to("topics_labels#destroy", :id => "1")
    end

  end
end
