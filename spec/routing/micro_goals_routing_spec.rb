require "rails_helper"

RSpec.describe MicroGoalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/micro_goals").to route_to("micro_goals#index")
    end

    it "routes to #new" do
      expect(get: "/micro_goals/new").to route_to("micro_goals#new")
    end

    it "routes to #show" do
      expect(get: "/micro_goals/1").to route_to("micro_goals#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/micro_goals/1/edit").to route_to("micro_goals#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/micro_goals").to route_to("micro_goals#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/micro_goals/1").to route_to("micro_goals#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/micro_goals/1").to route_to("micro_goals#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/micro_goals/1").to route_to("micro_goals#destroy", id: "1")
    end
  end
end
