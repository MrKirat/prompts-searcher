require 'rails_helper'

RSpec.describe "/prompts", type: :request do
  describe "GET /index" do
    let!(:prompt) { Prompt.create!(content: content) }
    let(:content) { 'Some funcy prompt...' }

    it "renders a successful response" do
      get prompts_url
      expect(response).to be_successful
      expect(response.body).to include(content)
    end
  end
end
