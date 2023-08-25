require 'rails_helper'

RSpec.describe "prompts/index", type: :view do
  before do
    assign(:prompts, [
      Prompt.create!(content: "Content"),
      Prompt.create!(content: "Content")
    ])
  end

  it "renders a list of prompts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Content".to_s), count: 2
  end
end
