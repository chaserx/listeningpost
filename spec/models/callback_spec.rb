require 'rails_helper'

RSpec.describe Callback, type: :model do
  describe 'validations' do
    subject { build(:callback, url: nil, device: nil) }

    it 'requires a url' do
      expect(subject).to have(1).error_on(:url)
      expect(subject).to be_invalid
    end

    it 'requires a device' do
      expect(subject).to have(1).error_on(:device)
      expect(subject).to be_invalid
    end
  end
end
