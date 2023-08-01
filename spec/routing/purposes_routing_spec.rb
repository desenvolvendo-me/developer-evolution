require "rails_helper"

RSpec.describe PurposesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/purposes").to route_to("purposes#index")
    end

    it "routes to #new" do
      expect(get: "/purposes/new").to route_to("purposes#new")
    end

    it "routes to #show" do
      expect(get: "/purposes/1").to route_to("purposes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/purposes/1/edit").to route_to("purposes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/purposes").to route_to("purposes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/purposes/1").to route_to("purposes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/purposes/1").to route_to("purposes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/purposes/1").to route_to("purposes#destroy", id: "1")
    end
  end
end
