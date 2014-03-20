require "spec_helper"

describe MicrositesController do
  describe "routing" do

    it "routes to #index" do
      get("/microsites").should route_to("microsites#index")
    end

    it "routes to #new" do
      get("/microsites/new").should route_to("microsites#new")
    end

    it "routes to #show" do
      get("/microsites/1").should route_to("microsites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/microsites/1/edit").should route_to("microsites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/microsites").should route_to("microsites#create")
    end

    it "routes to #update" do
      put("/microsites/1").should route_to("microsites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/microsites/1").should route_to("microsites#destroy", :id => "1")
    end

  end
end
