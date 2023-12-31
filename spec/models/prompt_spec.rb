require 'rails_helper'

RSpec.describe Prompt, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end
end
