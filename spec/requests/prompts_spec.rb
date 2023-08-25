require 'rails_helper'

RSpec.describe "/prompts", type: :request, elasticsearch: true do
  describe "GET /search" do
    let!(:prompt) { Prompt.create!(content: content) }
    let(:content) { 'Some funcy prompt...' }

    it "renders a successful response" do
      Prompt.__elasticsearch__.refresh_index!
      get search_prompts_url(query: content)
      expect(response).to be_successful
      expect(response.body).to include("prompt_search_item_#{prompt.id}")
    end
  end
end
