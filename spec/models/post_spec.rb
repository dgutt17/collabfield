require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Associations' do
    it 'belongs_to userf' do
      association = described_class.reflect_on_association(:user).macro
      expect(association).to eq :belongs_to
    end
    
    it 'belongs_to category' do
      assocation = described_class.reflect_on_association(:category).macro
      expect(assocation).to eq :belongs_to
    end
  end
end
