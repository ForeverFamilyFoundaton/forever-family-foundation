require "rails_helper"

RSpec.describe ExportsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/exports").to route_to("exports#index")
    end

    it "routes to #new" do
      expect(:get => "/exports/new").to route_to("exports#new")
    end

    it "routes to #show" do
      expect(:get => "/exports/1").to route_to("exports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/exports/1/edit").to route_to("exports#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/exports").to route_to("exports#create")
    end

    it "routes to #update" do
      expect(:put => "/exports/1").to route_to("exports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/exports/1").to route_to("exports#destroy", :id => "1")
    end

  end
end
