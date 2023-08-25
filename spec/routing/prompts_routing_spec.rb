require "rails_helper"

RSpec.describe PromptsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/prompts").to route_to("prompts#index")
    end
  end
end
