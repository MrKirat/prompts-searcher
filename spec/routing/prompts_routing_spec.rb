require "rails_helper"

RSpec.describe PromptsController, type: :routing do
  describe "routing" do
    it "routes to #search" do
      expect(get: "/prompts/search").to route_to("prompts#search")
    end
  end
end
