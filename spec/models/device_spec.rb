require 'rails_helper'

RSpec.describe Device, type: :model do
  describe 'validations' do
    subject { build(:device, name: nil, user: nil) }

    it 'requires a name' do
      expect(subject).to have(1).error_on(:name)
      expect(subject).to be_invalid
    end

    it 'requires a user' do
      expect(subject).to have(1).error_on(:user)
      expect(subject).to be_invalid
    end
  end
end
