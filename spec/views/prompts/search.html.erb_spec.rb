require 'rails_helper'

RSpec.describe "prompts/search", type: :view do
  let(:search_items) do
    [
      OpenStruct.new(id: 1, content: 'Content'),
      OpenStruct.new(id: 2, content: 'Content')
    ]
  end

  before do
    assign(:search_items, search_items)
    assign(:pagy, Pagy.new(count: 1000, size: []))
  end

  it "renders a list of prompts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Content".to_s), count: 2
  end
end
